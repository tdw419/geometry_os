; DESCRIPTION: Creates a cyan rectangular region at (84, 189) spanning 60 by 37 pixels.
; PLAN: r0=84(x), r1=189(y), r2=60(width), r3=37(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 189
LDI r2, 60
LDI r3, 37
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
