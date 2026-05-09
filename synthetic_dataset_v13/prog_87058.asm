; DESCRIPTION: Composite: Renders a red line between points (111, 3) and (21, 148) then Creates a white rectangular region at (431, 63) spanning 27 by 98 pixels.
; PLAN: r0=111(x1), r1=3(y1), r2=21(x2), r3=148(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=431(x), r6=63(y), r7=27(width), r8=98(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 111
LDI r1, 3
LDI r2, 21
LDI r3, 148
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 431
LDI r6, 63
LDI r7, 27
LDI r8, 98
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
