; DESCRIPTION: Composite: Renders a blue line between points (77, 138) and (126, 66) then Places a magenta circle of radius 16 at center (423, 91).
; PLAN: r0=77(x1), r1=138(y1), r2=126(x2), r3=66(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=423(x), r6=91(y), r7=16(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 77
LDI r1, 138
LDI r2, 126
LDI r3, 66
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 423
LDI r6, 91
LDI r7, 16
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
