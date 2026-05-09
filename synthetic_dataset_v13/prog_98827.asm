; DESCRIPTION: Composite: Places a purple 10x109 rectangle at position (241, 17) then Renders a magenta line between points (159, 245) and (282, 210).
; PLAN: r0=241(x), r1=17(y), r2=10(width), r3=109(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=159(x1), r6=245(y1), r7=282(x2), r8=210(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 241
LDI r1, 17
LDI r2, 10
LDI r3, 109
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 159
LDI r6, 245
LDI r7, 282
LDI r8, 210
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
