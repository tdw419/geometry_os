; DESCRIPTION: Composite: Renders a red disk with center (460, 198) and radius 20 then Draws a green line from (344, 126) to (244, 221) then Places a red dot at position (500, 90).
; PLAN: r0=460(x), r1=198(y), r2=20(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=344(x1), r6=126(y1), r7=244(x2), r8=221(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=500(x), r11=90(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 460
LDI r1, 198
LDI r2, 20
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 344
LDI r6, 126
LDI r7, 244
LDI r8, 221
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 500
LDI r11, 90
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
