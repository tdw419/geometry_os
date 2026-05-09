; DESCRIPTION: Composite: Places a yellow line segment connecting (461, 248) to (364, 111) then Renders a orange box of size 32x115 starting at (20, 70).
; PLAN: r0=461(x1), r1=248(y1), r2=364(x2), r3=111(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=20(x), r6=70(y), r7=32(width), r8=115(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 461
LDI r1, 248
LDI r2, 364
LDI r3, 111
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 20
LDI r6, 70
LDI r7, 32
LDI r8, 115
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
