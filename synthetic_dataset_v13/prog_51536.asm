; DESCRIPTION: Renders a black box of size 36x79 starting at (305, 127).
; PLAN: r0=305(x), r1=127(y), r2=36(width), r3=79(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 127
LDI r2, 36
LDI r3, 79
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
