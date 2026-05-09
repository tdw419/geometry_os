; DESCRIPTION: Creates a cyan rectangular region at (90, 63) spanning 101 by 58 pixels.
; PLAN: r0=90(x), r1=63(y), r2=101(width), r3=58(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 63
LDI r2, 101
LDI r3, 58
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
