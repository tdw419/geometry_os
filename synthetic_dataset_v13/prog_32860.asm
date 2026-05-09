; DESCRIPTION: Composite: Renders a yellow line between points (291, 148) and (102, 187) then Places a purple dot at position (224, 102).
; PLAN: r0=291(x1), r1=148(y1), r2=102(x2), r3=187(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=224(x), r6=102(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 291
LDI r1, 148
LDI r2, 102
LDI r3, 187
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 224
LDI r6, 102
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
