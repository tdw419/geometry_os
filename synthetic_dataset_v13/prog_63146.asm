; DESCRIPTION: Composite: Places a yellow circle of radius 71 at center (264, 114) then Draws a black line from (132, 177) to (103, 34) then Places a blue dot at position (190, 233).
; PLAN: r0=264(x), r1=114(y), r2=71(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=132(x1), r6=177(y1), r7=103(x2), r8=34(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=190(x), r11=233(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 264
LDI r1, 114
LDI r2, 71
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 132
LDI r6, 177
LDI r7, 103
LDI r8, 34
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 190
LDI r11, 233
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
