; DESCRIPTION: Composite: Draws a red line from (15, 152) to (124, 204) then Draws a red circle centered at (316, 148) with radius 49 then Places a cyan dot at position (460, 209).
; PLAN: r0=15(x1), r1=152(y1), r2=124(x2), r3=204(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=316(x), r6=148(y), r7=49(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=460(x), r11=209(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 15
LDI r1, 152
LDI r2, 124
LDI r3, 204
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 316
LDI r6, 148
LDI r7, 49
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 460
LDI r11, 209
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
