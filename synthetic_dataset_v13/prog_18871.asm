; DESCRIPTION: Composite: Renders a cyan line between points (385, 226) and (423, 131) then Places a purple dot at position (98, 98) then Creates a green rectangular region at (321, 87) spanning 39 by 51 pixels.
; PLAN: r0=385(x1), r1=226(y1), r2=423(x2), r3=131(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=98(x), r6=98(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=321(x), r11=87(y), r12=39(width), r13=51(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 385
LDI r1, 226
LDI r2, 423
LDI r3, 131
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 98
LDI r6, 98
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 321
LDI r11, 87
LDI r12, 39
LDI r13, 51
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
