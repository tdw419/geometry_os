; DESCRIPTION: Composite: Draws a black rectangle at (406, 82) with width 20 and height 29 then Renders a white line between points (308, 52) and (295, 155).
; PLAN: r0=406(x), r1=82(y), r2=20(width), r3=29(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=308(x1), r6=52(y1), r7=295(x2), r8=155(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 406
LDI r1, 82
LDI r2, 20
LDI r3, 29
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 308
LDI r6, 52
LDI r7, 295
LDI r8, 155
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
