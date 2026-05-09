; DESCRIPTION: Renders a blue box of size 47x24 starting at (328, 141).
; PLAN: r0=328(x), r1=141(y), r2=47(width), r3=24(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 141
LDI r2, 47
LDI r3, 24
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
