; DESCRIPTION: Renders a yellow box of size 13x79 starting at (491, 37).
; PLAN: r0=491(x), r1=37(y), r2=13(width), r3=79(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 37
LDI r2, 13
LDI r3, 79
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
