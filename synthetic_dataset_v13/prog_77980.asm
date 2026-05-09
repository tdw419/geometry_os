; DESCRIPTION: Composite: Renders a yellow line between points (205, 148) and (218, 26) then Places a purple dot at position (394, 203).
; PLAN: r0=205(x1), r1=148(y1), r2=218(x2), r3=26(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=394(x), r6=203(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 205
LDI r1, 148
LDI r2, 218
LDI r3, 26
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 394
LDI r6, 203
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
