; DESCRIPTION: Renders a blue box of size 94x74 starting at (213, 148).
; PLAN: r0=213(x), r1=148(y), r2=94(width), r3=74(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 148
LDI r2, 94
LDI r3, 74
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
