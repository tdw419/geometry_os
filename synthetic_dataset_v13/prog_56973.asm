; DESCRIPTION: Renders a blue box of size 75x54 starting at (115, 57).
; PLAN: r0=115(x), r1=57(y), r2=75(width), r3=54(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 57
LDI r2, 75
LDI r3, 54
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
