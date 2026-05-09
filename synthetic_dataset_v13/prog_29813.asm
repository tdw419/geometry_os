; DESCRIPTION: Composite: Renders a cyan line between points (71, 192) and (337, 223) then Places a purple dot at position (10, 12).
; PLAN: r0=71(x1), r1=192(y1), r2=337(x2), r3=223(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=10(x), r6=12(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 71
LDI r1, 192
LDI r2, 337
LDI r3, 223
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 10
LDI r6, 12
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
