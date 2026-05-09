; DESCRIPTION: Composite: Places a green dot at position (110, 1) then Renders a cyan disk with center (207, 207) and radius 31 then Renders a blue line between points (216, 47) and (425, 44).
; PLAN: r0=110(x), r1=1(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=207(x), r6=207(y), r7=31(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=216(x1), r11=47(y1), r12=425(x2), r13=44(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 110
LDI r1, 1
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 207
LDI r6, 207
LDI r7, 31
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 216
LDI r11, 47
LDI r12, 425
LDI r13, 44
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
