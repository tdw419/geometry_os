; DESCRIPTION: Composite: Places a purple line segment connecting (388, 164) to (214, 154) then Renders a orange box of size 16x101 starting at (16, 48).
; PLAN: r0=388(x1), r1=164(y1), r2=214(x2), r3=154(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=16(x), r6=48(y), r7=16(width), r8=101(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 388
LDI r1, 164
LDI r2, 214
LDI r3, 154
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 16
LDI r6, 48
LDI r7, 16
LDI r8, 101
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
