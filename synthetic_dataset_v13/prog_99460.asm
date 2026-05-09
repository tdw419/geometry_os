; DESCRIPTION: Composite: Places a magenta 45x65 rectangle at position (447, 167) then Renders a red line between points (108, 113) and (373, 117).
; PLAN: r0=447(x), r1=167(y), r2=45(width), r3=65(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=108(x1), r6=113(y1), r7=373(x2), r8=117(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 447
LDI r1, 167
LDI r2, 45
LDI r3, 65
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 108
LDI r6, 113
LDI r7, 373
LDI r8, 117
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
