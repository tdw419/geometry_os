; DESCRIPTION: Renders a blue box of size 24x23 starting at (86, 186).
; PLAN: r0=86(x), r1=186(y), r2=24(width), r3=23(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 186
LDI r2, 24
LDI r3, 23
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
