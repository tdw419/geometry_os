; DESCRIPTION: Renders a black box of size 106x91 starting at (79, 60).
; PLAN: r0=79(x), r1=60(y), r2=106(width), r3=91(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 60
LDI r2, 106
LDI r3, 91
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
