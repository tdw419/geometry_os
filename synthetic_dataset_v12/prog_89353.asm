; DESCRIPTION: Composite: Places a orange line segment connecting (405, 1) to (374, 202) then Renders a purple box of size 59x55 starting at (94, 199).
; PLAN: r0=405(x1), r1=1(y1), r2=374(x2), r3=202(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=94(x), r6=199(y), r7=59(width), r8=55(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 405
LDI r1, 1
LDI r2, 374
LDI r3, 202
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 94
LDI r6, 199
LDI r7, 59
LDI r8, 55
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
