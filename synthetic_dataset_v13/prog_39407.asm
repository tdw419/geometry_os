; DESCRIPTION: Composite: Sets a single purple pixel at (1, 24) then Draws a white line from (209, 130) to (258, 223) then Renders a red disk with center (162, 129) and radius 47.
; PLAN: r0=1(x), r1=24(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=209(x1), r6=130(y1), r7=258(x2), r8=223(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=162(x), r11=129(y), r12=47(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 1
LDI r1, 24
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 209
LDI r6, 130
LDI r7, 258
LDI r8, 223
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 162
LDI r11, 129
LDI r12, 47
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
