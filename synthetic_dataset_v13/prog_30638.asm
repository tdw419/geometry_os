; DESCRIPTION: Composite: Renders a white disk with center (446, 138) and radius 57 then Draws a blue line from (137, 205) to (322, 189).
; PLAN: r0=446(x), r1=138(y), r2=57(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=137(x1), r6=205(y1), r7=322(x2), r8=189(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 446
LDI r1, 138
LDI r2, 57
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 137
LDI r6, 205
LDI r7, 322
LDI r8, 189
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
