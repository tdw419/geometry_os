; DESCRIPTION: Creates a green rectangular region at (85, 130) spanning 47 by 63 pixels.
; PLAN: r0=85(x), r1=130(y), r2=47(width), r3=63(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 130
LDI r2, 47
LDI r3, 63
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
