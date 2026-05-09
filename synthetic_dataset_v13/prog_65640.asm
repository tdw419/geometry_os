; DESCRIPTION: Creates a blue rectangular region at (115, 18) spanning 27 by 15 pixels.
; PLAN: r0=115(x), r1=18(y), r2=27(width), r3=15(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 18
LDI r2, 27
LDI r3, 15
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
