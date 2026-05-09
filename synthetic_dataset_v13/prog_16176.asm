; DESCRIPTION: Composite: Draws a blue line from (272, 151) to (336, 166) then Places a magenta 43x71 rectangle at position (22, 45).
; PLAN: r0=272(x1), r1=151(y1), r2=336(x2), r3=166(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=22(x), r6=45(y), r7=43(width), r8=71(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 272
LDI r1, 151
LDI r2, 336
LDI r3, 166
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 22
LDI r6, 45
LDI r7, 43
LDI r8, 71
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
