; DESCRIPTION: Creates a cyan rectangular region at (307, 155) spanning 56 by 37 pixels.
; PLAN: r0=307(x), r1=155(y), r2=56(width), r3=37(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 155
LDI r2, 56
LDI r3, 37
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
