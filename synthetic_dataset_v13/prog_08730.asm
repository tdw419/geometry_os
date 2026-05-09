; DESCRIPTION: Composite: Places a black 26x63 rectangle at position (347, 12) then Renders a red line between points (253, 108) and (143, 177).
; PLAN: r0=347(x), r1=12(y), r2=26(width), r3=63(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=253(x1), r6=108(y1), r7=143(x2), r8=177(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 347
LDI r1, 12
LDI r2, 26
LDI r3, 63
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 253
LDI r6, 108
LDI r7, 143
LDI r8, 177
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
