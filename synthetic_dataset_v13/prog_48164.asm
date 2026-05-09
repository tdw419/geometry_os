; DESCRIPTION: Composite: Places a yellow circle of radius 25 at center (187, 157) then Places a yellow line segment connecting (321, 243) to (202, 168) then Places a purple dot at position (245, 36).
; PLAN: r0=187(x), r1=157(y), r2=25(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=321(x1), r6=243(y1), r7=202(x2), r8=168(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=245(x), r11=36(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 187
LDI r1, 157
LDI r2, 25
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 321
LDI r6, 243
LDI r7, 202
LDI r8, 168
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 245
LDI r11, 36
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
