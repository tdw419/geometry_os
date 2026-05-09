; DESCRIPTION: Renders a black box of size 28x117 starting at (221, 112).
; PLAN: r0=221(x), r1=112(y), r2=28(width), r3=117(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 112
LDI r2, 28
LDI r3, 117
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
