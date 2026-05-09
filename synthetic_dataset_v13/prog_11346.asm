; DESCRIPTION: Renders a green box of size 58x79 starting at (266, 160).
; PLAN: r0=266(x), r1=160(y), r2=58(width), r3=79(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 160
LDI r2, 58
LDI r3, 79
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
