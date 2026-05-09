; DESCRIPTION: Creates a blue rectangular region at (417, 90) spanning 91 by 52 pixels.
; PLAN: r0=417(x), r1=90(y), r2=91(width), r3=52(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 90
LDI r2, 91
LDI r3, 52
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
