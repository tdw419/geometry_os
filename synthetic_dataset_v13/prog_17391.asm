; DESCRIPTION: Composite: Places a purple 38x54 rectangle at position (410, 45) then Renders a purple line between points (104, 85) and (277, 184).
; PLAN: r0=410(x), r1=45(y), r2=38(width), r3=54(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=104(x1), r6=85(y1), r7=277(x2), r8=184(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 410
LDI r1, 45
LDI r2, 38
LDI r3, 54
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 104
LDI r6, 85
LDI r7, 277
LDI r8, 184
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
