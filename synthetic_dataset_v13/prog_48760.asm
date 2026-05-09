; DESCRIPTION: Composite: Renders a blue line between points (364, 225) and (195, 142) then Places a black 103x87 rectangle at position (181, 169).
; PLAN: r0=364(x1), r1=225(y1), r2=195(x2), r3=142(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=181(x), r6=169(y), r7=103(width), r8=87(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 364
LDI r1, 225
LDI r2, 195
LDI r3, 142
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 181
LDI r6, 169
LDI r7, 103
LDI r8, 87
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
