; DESCRIPTION: Renders a black box of size 35x25 starting at (79, 160).
; PLAN: r0=79(x), r1=160(y), r2=35(width), r3=25(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 160
LDI r2, 35
LDI r3, 25
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
