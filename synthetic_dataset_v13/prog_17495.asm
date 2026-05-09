; DESCRIPTION: Composite: Places a blue dot at position (45, 106) then Renders a purple disk with center (174, 60) and radius 57 then Renders a blue line between points (462, 109) and (168, 132).
; PLAN: r0=45(x), r1=106(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=174(x), r6=60(y), r7=57(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=462(x1), r11=109(y1), r12=168(x2), r13=132(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 45
LDI r1, 106
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 174
LDI r6, 60
LDI r7, 57
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 462
LDI r11, 109
LDI r12, 168
LDI r13, 132
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
