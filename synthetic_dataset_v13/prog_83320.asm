; DESCRIPTION: Composite: Draws a purple line from (143, 160) to (454, 78) then Places a red 59x100 rectangle at position (298, 14).
; PLAN: r0=143(x1), r1=160(y1), r2=454(x2), r3=78(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=298(x), r6=14(y), r7=59(width), r8=100(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 143
LDI r1, 160
LDI r2, 454
LDI r3, 78
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 298
LDI r6, 14
LDI r7, 59
LDI r8, 100
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
