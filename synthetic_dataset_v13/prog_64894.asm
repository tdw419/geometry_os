; DESCRIPTION: Composite: Renders a red line between points (59, 95) and (254, 114) then Places a purple 99x12 rectangle at position (376, 117).
; PLAN: r0=59(x1), r1=95(y1), r2=254(x2), r3=114(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=376(x), r6=117(y), r7=99(width), r8=12(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 59
LDI r1, 95
LDI r2, 254
LDI r3, 114
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 376
LDI r6, 117
LDI r7, 99
LDI r8, 12
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
