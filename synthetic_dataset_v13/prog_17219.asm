; DESCRIPTION: Renders a green box of size 112x32 starting at (390, 117).
; PLAN: r0=390(x), r1=117(y), r2=112(width), r3=32(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 117
LDI r2, 112
LDI r3, 32
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
