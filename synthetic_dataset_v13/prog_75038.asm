; DESCRIPTION: Composite: Places a green circle of radius 35 at center (477, 67) then Draws a blue line from (477, 138) to (102, 152) then Places a white dot at position (267, 238).
; PLAN: r0=477(x), r1=67(y), r2=35(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=477(x1), r6=138(y1), r7=102(x2), r8=152(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=267(x), r11=238(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 477
LDI r1, 67
LDI r2, 35
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 477
LDI r6, 138
LDI r7, 102
LDI r8, 152
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 267
LDI r11, 238
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
