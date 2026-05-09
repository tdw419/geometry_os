; DESCRIPTION: Composite: Renders a purple line between points (344, 20) and (360, 61) then Places a green 59x63 rectangle at position (373, 26).
; PLAN: r0=344(x1), r1=20(y1), r2=360(x2), r3=61(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=373(x), r6=26(y), r7=59(width), r8=63(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 344
LDI r1, 20
LDI r2, 360
LDI r3, 61
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 373
LDI r6, 26
LDI r7, 59
LDI r8, 63
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
