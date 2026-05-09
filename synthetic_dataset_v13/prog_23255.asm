; DESCRIPTION: Renders a black box of size 74x68 starting at (389, 180).
; PLAN: r0=389(x), r1=180(y), r2=74(width), r3=68(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 180
LDI r2, 74
LDI r3, 68
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
