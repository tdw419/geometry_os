; DESCRIPTION: Composite: Draws a white line from (346, 165) to (440, 144) then Renders a yellow disk with center (295, 162) and radius 49.
; PLAN: r0=346(x1), r1=165(y1), r2=440(x2), r3=144(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=295(x), r6=162(y), r7=49(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 346
LDI r1, 165
LDI r2, 440
LDI r3, 144
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 295
LDI r6, 162
LDI r7, 49
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
