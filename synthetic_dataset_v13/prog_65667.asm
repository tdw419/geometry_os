; DESCRIPTION: Composite: Creates a red rectangular region at (267, 3) spanning 81 by 68 pixels then Places a red line segment connecting (387, 36) to (220, 121).
; PLAN: r0=267(x), r1=3(y), r2=81(width), r3=68(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=387(x1), r6=36(y1), r7=220(x2), r8=121(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 267
LDI r1, 3
LDI r2, 81
LDI r3, 68
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 387
LDI r6, 36
LDI r7, 220
LDI r8, 121
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
