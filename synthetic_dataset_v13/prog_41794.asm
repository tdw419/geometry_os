; DESCRIPTION: Composite: Renders a red line between points (284, 173) and (328, 145) then Creates a black rectangular region at (106, 121) spanning 93 by 13 pixels.
; PLAN: r0=284(x1), r1=173(y1), r2=328(x2), r3=145(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=106(x), r6=121(y), r7=93(width), r8=13(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 284
LDI r1, 173
LDI r2, 328
LDI r3, 145
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 106
LDI r6, 121
LDI r7, 93
LDI r8, 13
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
