; DESCRIPTION: Composite: Draws a black line from (342, 191) to (208, 139) then Places a green circle of radius 11 at center (126, 231).
; PLAN: r0=342(x1), r1=191(y1), r2=208(x2), r3=139(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=126(x), r6=231(y), r7=11(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 342
LDI r1, 191
LDI r2, 208
LDI r3, 139
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 126
LDI r6, 231
LDI r7, 11
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
