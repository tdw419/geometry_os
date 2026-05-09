; DESCRIPTION: Composite: Places a black circle of radius 72 at center (345, 152) then Renders a orange line between points (46, 49) and (81, 243).
; PLAN: r0=345(x), r1=152(y), r2=72(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=46(x1), r6=49(y1), r7=81(x2), r8=243(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 345
LDI r1, 152
LDI r2, 72
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 46
LDI r6, 49
LDI r7, 81
LDI r8, 243
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
