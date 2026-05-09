; DESCRIPTION: Renders a blue box of size 93x109 starting at (152, 49).
; PLAN: r0=152(x), r1=49(y), r2=93(width), r3=109(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 49
LDI r2, 93
LDI r3, 109
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
