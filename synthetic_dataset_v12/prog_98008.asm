; DESCRIPTION: Composite: Renders a magenta box of size 120x95 starting at (17, 76) then Draws a red line from (186, 232) to (392, 27).
; PLAN: r0=17(x), r1=76(y), r2=120(width), r3=95(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=186(x1), r6=232(y1), r7=392(x2), r8=27(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 17
LDI r1, 76
LDI r2, 120
LDI r3, 95
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 186
LDI r6, 232
LDI r7, 392
LDI r8, 27
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
