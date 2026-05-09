; DESCRIPTION: Composite: Places a black dot at position (328, 133) then Places a cyan 80x50 rectangle at position (313, 113) then Draws a red line from (491, 156) to (236, 182).
; PLAN: r0=328(x), r1=133(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=313(x), r6=113(y), r7=80(width), r8=50(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=491(x1), r11=156(y1), r12=236(x2), r13=182(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 328
LDI r1, 133
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 313
LDI r6, 113
LDI r7, 80
LDI r8, 50
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 491
LDI r11, 156
LDI r12, 236
LDI r13, 182
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
