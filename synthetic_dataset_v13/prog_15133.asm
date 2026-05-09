; DESCRIPTION: Creates a blue rectangular region at (303, 130) spanning 103 by 97 pixels.
; PLAN: r0=303(x), r1=130(y), r2=103(width), r3=97(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 130
LDI r2, 103
LDI r3, 97
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
