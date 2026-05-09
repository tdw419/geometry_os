; DESCRIPTION: Composite: Draws a blue rectangle at (61, 65) with width 21 and height 99 then Renders a white line between points (400, 205) and (396, 93).
; PLAN: r0=61(x), r1=65(y), r2=21(width), r3=99(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=400(x1), r6=205(y1), r7=396(x2), r8=93(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 61
LDI r1, 65
LDI r2, 21
LDI r3, 99
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 400
LDI r6, 205
LDI r7, 396
LDI r8, 93
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
