; DESCRIPTION: Composite: Places a purple 58x120 rectangle at position (74, 129) then Places a green dot at position (202, 80) then Creates a green circular shape at (389, 47) with radius 44.
; PLAN: r0=74(x), r1=129(y), r2=58(width), r3=120(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=202(x), r6=80(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=389(x), r11=47(y), r12=44(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 74
LDI r1, 129
LDI r2, 58
LDI r3, 120
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 202
LDI r6, 80
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 389
LDI r11, 47
LDI r12, 44
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
