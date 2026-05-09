; DESCRIPTION: Composite: Places a white dot at position (368, 10) then Places a white circle of radius 16 at center (59, 146) then Draws a green line from (1, 199) to (104, 195).
; PLAN: r0=368(x), r1=10(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=59(x), r6=146(y), r7=16(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=1(x1), r11=199(y1), r12=104(x2), r13=195(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 368
LDI r1, 10
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 59
LDI r6, 146
LDI r7, 16
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 1
LDI r11, 199
LDI r12, 104
LDI r13, 195
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
