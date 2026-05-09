; DESCRIPTION: Composite: Places a orange 29x10 rectangle at position (421, 50) then Draws a green line from (391, 99) to (50, 169).
; PLAN: r0=421(x), r1=50(y), r2=29(width), r3=10(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=391(x1), r6=99(y1), r7=50(x2), r8=169(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 421
LDI r1, 50
LDI r2, 29
LDI r3, 10
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 391
LDI r6, 99
LDI r7, 50
LDI r8, 169
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
