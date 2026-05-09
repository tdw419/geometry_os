; DESCRIPTION: Renders a purple box of size 10x96 starting at (272, 117).
; PLAN: r0=272(x), r1=117(y), r2=10(width), r3=96(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 117
LDI r2, 10
LDI r3, 96
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
