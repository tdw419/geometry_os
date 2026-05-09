; DESCRIPTION: Composite: Renders a orange line between points (93, 221) and (228, 108) then Creates a magenta rectangular region at (250, 99) spanning 25 by 27 pixels.
; PLAN: r0=93(x1), r1=221(y1), r2=228(x2), r3=108(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=250(x), r6=99(y), r7=25(width), r8=27(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 93
LDI r1, 221
LDI r2, 228
LDI r3, 108
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 250
LDI r6, 99
LDI r7, 25
LDI r8, 27
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
