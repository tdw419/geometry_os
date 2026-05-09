; DESCRIPTION: Composite: Places a yellow dot at position (318, 84) then Places a blue line segment connecting (182, 1) to (149, 242).
; PLAN: r0=318(x), r1=84(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=182(x1), r6=1(y1), r7=149(x2), r8=242(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 318
LDI r1, 84
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 182
LDI r6, 1
LDI r7, 149
LDI r8, 242
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
