; DESCRIPTION: Renders a purple box of size 110x58 starting at (281, 91).
; PLAN: r0=281(x), r1=91(y), r2=110(width), r3=58(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 91
LDI r2, 110
LDI r3, 58
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
