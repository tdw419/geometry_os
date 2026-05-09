; DESCRIPTION: Composite: Places a yellow line segment connecting (82, 8) to (131, 52) then Creates a orange rectangular region at (127, 61) spanning 94 by 91 pixels.
; PLAN: r0=82(x1), r1=8(y1), r2=131(x2), r3=52(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=127(x), r6=61(y), r7=94(width), r8=91(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 82
LDI r1, 8
LDI r2, 131
LDI r3, 52
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 127
LDI r6, 61
LDI r7, 94
LDI r8, 91
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
