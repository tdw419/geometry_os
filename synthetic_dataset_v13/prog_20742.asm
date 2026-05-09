; DESCRIPTION: Composite: Renders a cyan line between points (188, 203) and (418, 195) then Places a red dot at position (380, 179) then Places a blue circle of radius 64 at center (160, 124).
; PLAN: r0=188(x1), r1=203(y1), r2=418(x2), r3=195(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=380(x), r6=179(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=160(x), r11=124(y), r12=64(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 188
LDI r1, 203
LDI r2, 418
LDI r3, 195
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 380
LDI r6, 179
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 160
LDI r11, 124
LDI r12, 64
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
