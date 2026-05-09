; DESCRIPTION: Composite: Places a cyan circle of radius 29 at center (355, 36) then Draws a yellow line from (398, 163) to (131, 118) then Places a black dot at position (488, 15).
; PLAN: r0=355(x), r1=36(y), r2=29(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=398(x1), r6=163(y1), r7=131(x2), r8=118(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=488(x), r11=15(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 355
LDI r1, 36
LDI r2, 29
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 398
LDI r6, 163
LDI r7, 131
LDI r8, 118
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 488
LDI r11, 15
LDI r12, 0x000000
PSET r10, r11, r12
HALT
