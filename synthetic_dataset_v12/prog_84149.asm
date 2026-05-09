; DESCRIPTION: Composite: Draws a yellow line from (249, 206) to (2, 254) then Places a yellow 79x63 rectangle at position (79, 78).
; PLAN: r0=249(x1), r1=206(y1), r2=2(x2), r3=254(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=79(x), r6=78(y), r7=79(width), r8=63(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 249
LDI r1, 206
LDI r2, 2
LDI r3, 254
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 79
LDI r6, 78
LDI r7, 79
LDI r8, 63
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
