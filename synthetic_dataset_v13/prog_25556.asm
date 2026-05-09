; DESCRIPTION: Composite: Places a yellow line segment connecting (194, 200) to (404, 27) then Places a magenta 93x71 rectangle at position (148, 2).
; PLAN: r0=194(x1), r1=200(y1), r2=404(x2), r3=27(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=148(x), r6=2(y), r7=93(width), r8=71(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 194
LDI r1, 200
LDI r2, 404
LDI r3, 27
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 148
LDI r6, 2
LDI r7, 93
LDI r8, 71
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
