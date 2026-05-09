; DESCRIPTION: Renders a black box of size 51x68 starting at (38, 152).
; PLAN: r0=38(x), r1=152(y), r2=51(width), r3=68(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 152
LDI r2, 51
LDI r3, 68
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
