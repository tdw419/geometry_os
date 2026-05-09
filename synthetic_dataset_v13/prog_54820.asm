; DESCRIPTION: Renders a black box of size 79x69 starting at (402, 160).
; PLAN: r0=402(x), r1=160(y), r2=79(width), r3=69(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 160
LDI r2, 79
LDI r3, 69
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
