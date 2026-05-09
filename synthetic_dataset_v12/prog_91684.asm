; DESCRIPTION: Composite: Draws a cyan line from (447, 241) to (441, 66) then Places a yellow 100x109 rectangle at position (308, 146).
; PLAN: r0=447(x1), r1=241(y1), r2=441(x2), r3=66(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=308(x), r6=146(y), r7=100(width), r8=109(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 447
LDI r1, 241
LDI r2, 441
LDI r3, 66
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 308
LDI r6, 146
LDI r7, 100
LDI r8, 109
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
