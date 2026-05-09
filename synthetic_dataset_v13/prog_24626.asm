; DESCRIPTION: Composite: Draws a red line from (256, 204) to (111, 31) then Draws a cyan circle centered at (68, 164) with radius 25 then Sets a single white pixel at (58, 203).
; PLAN: r0=256(x1), r1=204(y1), r2=111(x2), r3=31(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=68(x), r6=164(y), r7=25(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=58(x), r11=203(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 256
LDI r1, 204
LDI r2, 111
LDI r3, 31
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 68
LDI r6, 164
LDI r7, 25
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 58
LDI r11, 203
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
