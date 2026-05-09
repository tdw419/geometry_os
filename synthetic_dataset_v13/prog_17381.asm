; DESCRIPTION: Composite: Places a orange dot at position (36, 85) then Places a yellow line segment connecting (493, 2) to (507, 62) then Renders a purple box of size 56x61 starting at (425, 120).
; PLAN: r0=36(x), r1=85(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=493(x1), r6=2(y1), r7=507(x2), r8=62(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=425(x), r11=120(y), r12=56(width), r13=61(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 36
LDI r1, 85
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 493
LDI r6, 2
LDI r7, 507
LDI r8, 62
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 425
LDI r11, 120
LDI r12, 56
LDI r13, 61
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
