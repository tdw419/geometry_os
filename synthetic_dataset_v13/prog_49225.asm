; DESCRIPTION: Composite: Draws a cyan line from (52, 189) to (54, 52) then Places a black circle of radius 13 at center (180, 137).
; PLAN: r0=52(x1), r1=189(y1), r2=54(x2), r3=52(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=180(x), r6=137(y), r7=13(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 52
LDI r1, 189
LDI r2, 54
LDI r3, 52
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 180
LDI r6, 137
LDI r7, 13
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
