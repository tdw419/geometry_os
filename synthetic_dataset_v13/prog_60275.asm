; DESCRIPTION: Composite: Renders a black line between points (38, 178) and (436, 37) then Places a black 89x37 rectangle at position (130, 36) then Sets a single magenta pixel at (398, 124).
; PLAN: r0=38(x1), r1=178(y1), r2=436(x2), r3=37(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=130(x), r6=36(y), r7=89(width), r8=37(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=398(x), r11=124(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 38
LDI r1, 178
LDI r2, 436
LDI r3, 37
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 130
LDI r6, 36
LDI r7, 89
LDI r8, 37
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 398
LDI r11, 124
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
