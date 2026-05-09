; DESCRIPTION: Composite: Sets a single green pixel at (461, 253) then Places a orange circle of radius 22 at center (103, 47) then Draws a white line from (231, 175) to (120, 180).
; PLAN: r0=461(x), r1=253(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=103(x), r6=47(y), r7=22(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=231(x1), r11=175(y1), r12=120(x2), r13=180(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 461
LDI r1, 253
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 103
LDI r6, 47
LDI r7, 22
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 231
LDI r11, 175
LDI r12, 120
LDI r13, 180
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
