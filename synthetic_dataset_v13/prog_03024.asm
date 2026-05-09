; DESCRIPTION: Composite: Places a cyan circle of radius 69 at center (366, 72) then Draws a yellow line from (285, 49) to (221, 148).
; PLAN: r0=366(x), r1=72(y), r2=69(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=285(x1), r6=49(y1), r7=221(x2), r8=148(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 366
LDI r1, 72
LDI r2, 69
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 285
LDI r6, 49
LDI r7, 221
LDI r8, 148
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
