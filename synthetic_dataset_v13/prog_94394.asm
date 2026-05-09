; DESCRIPTION: Composite: Places a red line segment connecting (198, 236) to (167, 188) then Places a yellow 44x106 rectangle at position (86, 143).
; PLAN: r0=198(x1), r1=236(y1), r2=167(x2), r3=188(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=86(x), r6=143(y), r7=44(width), r8=106(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 198
LDI r1, 236
LDI r2, 167
LDI r3, 188
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 86
LDI r6, 143
LDI r7, 44
LDI r8, 106
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
