; DESCRIPTION: Composite: Draws a red line from (157, 197) to (352, 235) then Renders a yellow disk with center (322, 196) and radius 54 then Places a yellow dot at position (370, 187).
; PLAN: r0=157(x1), r1=197(y1), r2=352(x2), r3=235(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=322(x), r6=196(y), r7=54(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=370(x), r11=187(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 157
LDI r1, 197
LDI r2, 352
LDI r3, 235
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 322
LDI r6, 196
LDI r7, 54
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 370
LDI r11, 187
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
