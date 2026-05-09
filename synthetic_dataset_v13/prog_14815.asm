; DESCRIPTION: Composite: Renders a red box of size 12x115 starting at (267, 58) then Renders a green line between points (501, 136) and (199, 5).
; PLAN: r0=267(x), r1=58(y), r2=12(width), r3=115(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=501(x1), r6=136(y1), r7=199(x2), r8=5(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 267
LDI r1, 58
LDI r2, 12
LDI r3, 115
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 501
LDI r6, 136
LDI r7, 199
LDI r8, 5
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
