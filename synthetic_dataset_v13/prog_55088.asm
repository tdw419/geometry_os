; DESCRIPTION: Composite: Creates a red circular shape at (45, 134) with radius 23 then Draws a blue line from (196, 134) to (25, 208).
; PLAN: r0=45(x), r1=134(y), r2=23(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=196(x1), r6=134(y1), r7=25(x2), r8=208(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 45
LDI r1, 134
LDI r2, 23
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 196
LDI r6, 134
LDI r7, 25
LDI r8, 208
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
