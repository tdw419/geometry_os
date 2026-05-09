; DESCRIPTION: Composite: Renders a black disk with center (380, 82) and radius 74 then Places a black dot at position (296, 150) then Renders a yellow line between points (86, 38) and (376, 227).
; PLAN: r0=380(x), r1=82(y), r2=74(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=296(x), r6=150(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=86(x1), r11=38(y1), r12=376(x2), r13=227(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 380
LDI r1, 82
LDI r2, 74
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 296
LDI r6, 150
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 86
LDI r11, 38
LDI r12, 376
LDI r13, 227
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
