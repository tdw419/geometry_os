; DESCRIPTION: Composite: Places a white line segment connecting (118, 11) to (26, 53) then Places a green dot at position (221, 129) then Places a cyan circle of radius 61 at center (174, 173).
; PLAN: r0=118(x1), r1=11(y1), r2=26(x2), r3=53(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=221(x), r6=129(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=174(x), r11=173(y), r12=61(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 118
LDI r1, 11
LDI r2, 26
LDI r3, 53
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 221
LDI r6, 129
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 174
LDI r11, 173
LDI r12, 61
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
