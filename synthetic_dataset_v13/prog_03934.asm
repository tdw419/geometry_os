; DESCRIPTION: Composite: Sets a single cyan pixel at (277, 236) then Renders a orange line between points (186, 199) and (230, 18) then Places a yellow 66x117 rectangle at position (420, 116).
; PLAN: r0=277(x), r1=236(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=186(x1), r6=199(y1), r7=230(x2), r8=18(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=420(x), r11=116(y), r12=66(width), r13=117(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 277
LDI r1, 236
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 186
LDI r6, 199
LDI r7, 230
LDI r8, 18
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 420
LDI r11, 116
LDI r12, 66
LDI r13, 117
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
