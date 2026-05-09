; DESCRIPTION: Creates a green rectangular region at (230, 130) spanning 36 by 85 pixels.
; PLAN: r0=230(x), r1=130(y), r2=36(width), r3=85(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 130
LDI r2, 36
LDI r3, 85
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
