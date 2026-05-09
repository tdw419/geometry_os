; DESCRIPTION: Composite: Places a blue 26x110 rectangle at position (72, 69) then Renders a red line between points (19, 12) and (57, 144).
; PLAN: r0=72(x), r1=69(y), r2=26(width), r3=110(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=19(x1), r6=12(y1), r7=57(x2), r8=144(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 72
LDI r1, 69
LDI r2, 26
LDI r3, 110
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 19
LDI r6, 12
LDI r7, 57
LDI r8, 144
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
