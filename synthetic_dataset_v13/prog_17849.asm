; DESCRIPTION: Composite: Creates a white circular shape at (92, 26) with radius 18 then Places a green dot at position (304, 10) then Renders a blue line between points (103, 230) and (94, 9).
; PLAN: r0=92(x), r1=26(y), r2=18(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=304(x), r6=10(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=103(x1), r11=230(y1), r12=94(x2), r13=9(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 92
LDI r1, 26
LDI r2, 18
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 304
LDI r6, 10
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 103
LDI r11, 230
LDI r12, 94
LDI r13, 9
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
