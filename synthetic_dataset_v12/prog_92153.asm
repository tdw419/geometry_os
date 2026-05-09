; DESCRIPTION: Composite: Places a red 105x120 rectangle at position (81, 59) then Renders a magenta line between points (285, 167) and (279, 248).
; PLAN: r0=81(x), r1=59(y), r2=105(width), r3=120(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=285(x1), r6=167(y1), r7=279(x2), r8=248(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 81
LDI r1, 59
LDI r2, 105
LDI r3, 120
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 285
LDI r6, 167
LDI r7, 279
LDI r8, 248
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
