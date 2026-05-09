; DESCRIPTION: Composite: Sets a single white pixel at (102, 24) then Renders a green line between points (433, 24) and (221, 180) then Places a yellow circle of radius 64 at center (263, 121).
; PLAN: r0=102(x), r1=24(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=433(x1), r6=24(y1), r7=221(x2), r8=180(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=263(x), r11=121(y), r12=64(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 102
LDI r1, 24
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 433
LDI r6, 24
LDI r7, 221
LDI r8, 180
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 263
LDI r11, 121
LDI r12, 64
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
