; DESCRIPTION: Composite: Draws a red line from (205, 154) to (487, 194) then Draws a magenta rectangle at (245, 23) with width 80 and height 38.
; PLAN: r0=205(x1), r1=154(y1), r2=487(x2), r3=194(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=245(x), r6=23(y), r7=80(width), r8=38(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 205
LDI r1, 154
LDI r2, 487
LDI r3, 194
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 245
LDI r6, 23
LDI r7, 80
LDI r8, 38
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
