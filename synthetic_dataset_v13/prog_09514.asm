; DESCRIPTION: Renders a blue box of size 79x91 starting at (248, 117).
; PLAN: r0=248(x), r1=117(y), r2=79(width), r3=91(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 117
LDI r2, 79
LDI r3, 91
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
