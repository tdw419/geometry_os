; DESCRIPTION: Renders a black box of size 51x16 starting at (92, 85).
; PLAN: r0=92(x), r1=85(y), r2=51(width), r3=16(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 85
LDI r2, 51
LDI r3, 16
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
