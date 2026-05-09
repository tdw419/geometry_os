; DESCRIPTION: Renders a purple box of size 117x44 starting at (281, 159).
; PLAN: r0=281(x), r1=159(y), r2=117(width), r3=44(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 159
LDI r2, 117
LDI r3, 44
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
