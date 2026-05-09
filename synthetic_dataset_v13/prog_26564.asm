; DESCRIPTION: Renders a black box of size 92x79 starting at (305, 115).
; PLAN: r0=305(x), r1=115(y), r2=92(width), r3=79(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 115
LDI r2, 92
LDI r3, 79
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
