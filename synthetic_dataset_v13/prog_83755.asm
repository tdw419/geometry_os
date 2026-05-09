; DESCRIPTION: Composite: Sets a single black pixel at (274, 64) then Renders a orange box of size 32x119 starting at (413, 76) then Places a cyan line segment connecting (162, 220) to (450, 212).
; PLAN: r0=274(x), r1=64(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=413(x), r6=76(y), r7=32(width), r8=119(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=162(x1), r11=220(y1), r12=450(x2), r13=212(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 274
LDI r1, 64
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 413
LDI r6, 76
LDI r7, 32
LDI r8, 119
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 162
LDI r11, 220
LDI r12, 450
LDI r13, 212
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
