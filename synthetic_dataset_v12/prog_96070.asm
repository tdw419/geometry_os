; DESCRIPTION: Composite: Renders a green line between points (1, 109) and (178, 112) then Places a black circle of radius 69 at center (196, 146).
; PLAN: r0=1(x1), r1=109(y1), r2=178(x2), r3=112(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=196(x), r6=146(y), r7=69(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 1
LDI r1, 109
LDI r2, 178
LDI r3, 112
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 196
LDI r6, 146
LDI r7, 69
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
