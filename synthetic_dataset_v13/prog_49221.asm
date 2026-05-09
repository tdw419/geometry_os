; DESCRIPTION: Composite: Renders a magenta line between points (295, 225) and (288, 105) then Places a yellow circle of radius 47 at center (327, 183).
; PLAN: r0=295(x1), r1=225(y1), r2=288(x2), r3=105(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=327(x), r6=183(y), r7=47(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 295
LDI r1, 225
LDI r2, 288
LDI r3, 105
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 327
LDI r6, 183
LDI r7, 47
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
