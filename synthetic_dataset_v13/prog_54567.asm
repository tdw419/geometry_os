; DESCRIPTION: Composite: Places a red dot at position (282, 226) then Draws a green circle centered at (187, 161) with radius 51 then Renders a cyan line between points (272, 163) and (436, 241).
; PLAN: r0=282(x), r1=226(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=187(x), r6=161(y), r7=51(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=272(x1), r11=163(y1), r12=436(x2), r13=241(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 282
LDI r1, 226
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 187
LDI r6, 161
LDI r7, 51
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 272
LDI r11, 163
LDI r12, 436
LDI r13, 241
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
