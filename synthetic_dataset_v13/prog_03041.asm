; DESCRIPTION: Composite: Places a red dot at position (180, 238) then Draws a red line from (462, 35) to (346, 113) then Places a black 15x13 rectangle at position (373, 170).
; PLAN: r0=180(x), r1=238(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=462(x1), r6=35(y1), r7=346(x2), r8=113(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=373(x), r11=170(y), r12=15(width), r13=13(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 180
LDI r1, 238
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 462
LDI r6, 35
LDI r7, 346
LDI r8, 113
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 373
LDI r11, 170
LDI r12, 15
LDI r13, 13
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
