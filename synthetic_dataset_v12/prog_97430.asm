; DESCRIPTION: Composite: Renders a green disk with center (380, 133) and radius 58 then Draws a cyan line from (155, 204) to (160, 17) then Places a yellow dot at position (202, 210).
; PLAN: r0=380(x), r1=133(y), r2=58(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=155(x1), r6=204(y1), r7=160(x2), r8=17(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=202(x), r11=210(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 380
LDI r1, 133
LDI r2, 58
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 155
LDI r6, 204
LDI r7, 160
LDI r8, 17
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 202
LDI r11, 210
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
