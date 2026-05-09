; DESCRIPTION: Composite: Draws a red line from (356, 17) to (449, 44) then Places a cyan circle of radius 55 at center (327, 149).
; PLAN: r0=356(x1), r1=17(y1), r2=449(x2), r3=44(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=327(x), r6=149(y), r7=55(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 356
LDI r1, 17
LDI r2, 449
LDI r3, 44
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 327
LDI r6, 149
LDI r7, 55
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
