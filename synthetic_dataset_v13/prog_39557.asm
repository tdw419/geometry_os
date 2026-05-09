; DESCRIPTION: Renders a purple box of size 86x91 starting at (125, 37).
; PLAN: r0=125(x), r1=37(y), r2=86(width), r3=91(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 37
LDI r2, 86
LDI r3, 91
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
