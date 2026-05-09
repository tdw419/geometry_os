; DESCRIPTION: Composite: Renders a green box of size 115x58 starting at (205, 72) then Places a blue dot at position (409, 25).
; PLAN: r0=205(x), r1=72(y), r2=115(width), r3=58(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=409(x), r6=25(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 205
LDI r1, 72
LDI r2, 115
LDI r3, 58
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 409
LDI r6, 25
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
