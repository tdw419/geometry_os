; DESCRIPTION: Composite: Renders a yellow line between points (505, 167) and (93, 238) then Places a yellow 106x17 rectangle at position (198, 176).
; PLAN: r0=505(x1), r1=167(y1), r2=93(x2), r3=238(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=198(x), r6=176(y), r7=106(width), r8=17(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 505
LDI r1, 167
LDI r2, 93
LDI r3, 238
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 198
LDI r6, 176
LDI r7, 106
LDI r8, 17
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
