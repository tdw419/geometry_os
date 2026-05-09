; DESCRIPTION: Composite: Places a yellow dot at position (175, 208) then Places a yellow line segment connecting (401, 105) to (480, 21) then Renders a white disk with center (306, 221) and radius 14.
; PLAN: r0=175(x), r1=208(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=401(x1), r6=105(y1), r7=480(x2), r8=21(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=306(x), r11=221(y), r12=14(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 175
LDI r1, 208
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 401
LDI r6, 105
LDI r7, 480
LDI r8, 21
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 306
LDI r11, 221
LDI r12, 14
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
