; DESCRIPTION: Composite: Places a magenta 47x74 rectangle at position (400, 36) then Renders a yellow line between points (465, 246) and (108, 168).
; PLAN: r0=400(x), r1=36(y), r2=47(width), r3=74(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=465(x1), r6=246(y1), r7=108(x2), r8=168(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 400
LDI r1, 36
LDI r2, 47
LDI r3, 74
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 465
LDI r6, 246
LDI r7, 108
LDI r8, 168
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
