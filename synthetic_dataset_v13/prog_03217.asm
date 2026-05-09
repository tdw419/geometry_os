; DESCRIPTION: Renders a black box of size 51x99 starting at (195, 38).
; PLAN: r0=195(x), r1=38(y), r2=51(width), r3=99(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 38
LDI r2, 51
LDI r3, 99
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
