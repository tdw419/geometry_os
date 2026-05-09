; DESCRIPTION: Composite: Places a yellow circle of radius 58 at center (414, 159) then Places a black line segment connecting (18, 59) to (271, 93).
; PLAN: r0=414(x), r1=159(y), r2=58(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=18(x1), r6=59(y1), r7=271(x2), r8=93(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 414
LDI r1, 159
LDI r2, 58
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 18
LDI r6, 59
LDI r7, 271
LDI r8, 93
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
