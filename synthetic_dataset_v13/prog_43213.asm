; DESCRIPTION: Composite: Renders a yellow box of size 93x26 starting at (68, 92) then Renders a magenta line between points (61, 220) and (169, 58).
; PLAN: r0=68(x), r1=92(y), r2=93(width), r3=26(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=61(x1), r6=220(y1), r7=169(x2), r8=58(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 68
LDI r1, 92
LDI r2, 93
LDI r3, 26
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 61
LDI r6, 220
LDI r7, 169
LDI r8, 58
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
