; DESCRIPTION: Composite: Places a white dot at position (316, 108) then Places a cyan circle of radius 32 at center (347, 73) then Draws a orange line from (38, 36) to (33, 28).
; PLAN: r0=316(x), r1=108(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=347(x), r6=73(y), r7=32(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=38(x1), r11=36(y1), r12=33(x2), r13=28(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 316
LDI r1, 108
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 347
LDI r6, 73
LDI r7, 32
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 38
LDI r11, 36
LDI r12, 33
LDI r13, 28
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
