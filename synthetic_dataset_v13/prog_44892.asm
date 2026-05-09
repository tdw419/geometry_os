; DESCRIPTION: Composite: Renders a red disk with center (292, 75) and radius 67 then Renders a green box of size 52x10 starting at (400, 182) then Places a red line segment connecting (200, 50) to (223, 228).
; PLAN: r0=292(x), r1=75(y), r2=67(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=400(x), r6=182(y), r7=52(width), r8=10(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=200(x1), r11=50(y1), r12=223(x2), r13=228(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 292
LDI r1, 75
LDI r2, 67
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 400
LDI r6, 182
LDI r7, 52
LDI r8, 10
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 200
LDI r11, 50
LDI r12, 223
LDI r13, 228
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
