; DESCRIPTION: Composite: Places a cyan dot at position (211, 248) then Draws a red line from (41, 229) to (419, 154) then Places a red 25x18 rectangle at position (34, 159).
; PLAN: r0=211(x), r1=248(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=41(x1), r6=229(y1), r7=419(x2), r8=154(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=34(x), r11=159(y), r12=25(width), r13=18(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 211
LDI r1, 248
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 41
LDI r6, 229
LDI r7, 419
LDI r8, 154
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 34
LDI r11, 159
LDI r12, 25
LDI r13, 18
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
