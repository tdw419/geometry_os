; DESCRIPTION: Composite: Places a orange 85x88 rectangle at position (174, 149) then Draws a black line from (349, 150) to (454, 253).
; PLAN: r0=174(x), r1=149(y), r2=85(width), r3=88(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=349(x1), r6=150(y1), r7=454(x2), r8=253(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 174
LDI r1, 149
LDI r2, 85
LDI r3, 88
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 349
LDI r6, 150
LDI r7, 454
LDI r8, 253
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
