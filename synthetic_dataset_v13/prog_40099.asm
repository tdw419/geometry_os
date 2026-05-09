; DESCRIPTION: Composite: Places a purple dot at position (290, 230) then Renders a green disk with center (175, 178) and radius 71 then Places a blue line segment connecting (410, 11) to (18, 31).
; PLAN: r0=290(x), r1=230(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=175(x), r6=178(y), r7=71(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=410(x1), r11=11(y1), r12=18(x2), r13=31(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 290
LDI r1, 230
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 175
LDI r6, 178
LDI r7, 71
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 410
LDI r11, 11
LDI r12, 18
LDI r13, 31
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
