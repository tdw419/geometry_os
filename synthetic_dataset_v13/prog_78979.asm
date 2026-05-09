; DESCRIPTION: Composite: Renders a yellow line between points (35, 42) and (267, 140) then Creates a white rectangular region at (59, 176) spanning 103 by 54 pixels.
; PLAN: r0=35(x1), r1=42(y1), r2=267(x2), r3=140(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=59(x), r6=176(y), r7=103(width), r8=54(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 35
LDI r1, 42
LDI r2, 267
LDI r3, 140
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 59
LDI r6, 176
LDI r7, 103
LDI r8, 54
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
