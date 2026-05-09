; DESCRIPTION: Composite: Renders a magenta box of size 91x51 starting at (403, 189) then Places a black line segment connecting (332, 190) to (316, 253).
; PLAN: r0=403(x), r1=189(y), r2=91(width), r3=51(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=332(x1), r6=190(y1), r7=316(x2), r8=253(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 403
LDI r1, 189
LDI r2, 91
LDI r3, 51
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 332
LDI r6, 190
LDI r7, 316
LDI r8, 253
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
