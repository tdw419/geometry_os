; DESCRIPTION: Composite: Draws a black circle centered at (74, 102) with radius 21 then Renders a white line between points (304, 196) and (400, 35) then Sets a single green pixel at (337, 190).
; PLAN: r0=74(x), r1=102(y), r2=21(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=304(x1), r6=196(y1), r7=400(x2), r8=35(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=337(x), r11=190(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 74
LDI r1, 102
LDI r2, 21
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 304
LDI r6, 196
LDI r7, 400
LDI r8, 35
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 337
LDI r11, 190
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
