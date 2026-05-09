; DESCRIPTION: Composite: Draws a green line from (143, 17) to (246, 131) then Places a magenta 91x63 rectangle at position (144, 112).
; PLAN: r0=143(x1), r1=17(y1), r2=246(x2), r3=131(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=144(x), r6=112(y), r7=91(width), r8=63(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 143
LDI r1, 17
LDI r2, 246
LDI r3, 131
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 144
LDI r6, 112
LDI r7, 91
LDI r8, 63
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
