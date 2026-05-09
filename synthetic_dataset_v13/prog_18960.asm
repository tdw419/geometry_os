; DESCRIPTION: Renders a black box of size 14x79 starting at (69, 160).
; PLAN: r0=69(x), r1=160(y), r2=14(width), r3=79(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 160
LDI r2, 14
LDI r3, 79
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
