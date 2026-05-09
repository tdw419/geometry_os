; DESCRIPTION: Composite: Places a white dot at position (481, 120) then Draws a magenta line from (303, 95) to (308, 159) then Places a yellow 27x83 rectangle at position (116, 120).
; PLAN: r0=481(x), r1=120(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=303(x1), r6=95(y1), r7=308(x2), r8=159(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=116(x), r11=120(y), r12=27(width), r13=83(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 481
LDI r1, 120
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 303
LDI r6, 95
LDI r7, 308
LDI r8, 159
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 116
LDI r11, 120
LDI r12, 27
LDI r13, 83
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
