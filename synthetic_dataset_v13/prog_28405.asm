; DESCRIPTION: Composite: Places a yellow dot at position (29, 174) then Renders a blue line between points (334, 243) and (59, 142).
; PLAN: r0=29(x), r1=174(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=334(x1), r6=243(y1), r7=59(x2), r8=142(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 29
LDI r1, 174
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 334
LDI r6, 243
LDI r7, 59
LDI r8, 142
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
