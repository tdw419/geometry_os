; DESCRIPTION: Renders a black box of size 72x15 starting at (170, 180).
; PLAN: r0=170(x), r1=180(y), r2=72(width), r3=15(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 180
LDI r2, 72
LDI r3, 15
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
