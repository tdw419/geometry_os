; DESCRIPTION: Composite: Places a yellow dot at position (285, 152) then Draws a cyan line from (34, 142) to (53, 176) then Renders a black disk with center (439, 61) and radius 59.
; PLAN: r0=285(x), r1=152(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=34(x1), r6=142(y1), r7=53(x2), r8=176(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=439(x), r11=61(y), r12=59(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 285
LDI r1, 152
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 34
LDI r6, 142
LDI r7, 53
LDI r8, 176
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 439
LDI r11, 61
LDI r12, 59
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
