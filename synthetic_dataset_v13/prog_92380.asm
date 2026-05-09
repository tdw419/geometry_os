; DESCRIPTION: Renders a yellow box of size 79x91 starting at (30, 141).
; PLAN: r0=30(x), r1=141(y), r2=79(width), r3=91(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 141
LDI r2, 79
LDI r3, 91
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
