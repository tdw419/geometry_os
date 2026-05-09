; DESCRIPTION: Composite: Creates a magenta circular shape at (365, 167) with radius 80 then Draws a green line from (469, 233) to (286, 96) then Places a yellow dot at position (411, 9).
; PLAN: r0=365(x), r1=167(y), r2=80(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=469(x1), r6=233(y1), r7=286(x2), r8=96(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=411(x), r11=9(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 365
LDI r1, 167
LDI r2, 80
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 469
LDI r6, 233
LDI r7, 286
LDI r8, 96
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 411
LDI r11, 9
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
