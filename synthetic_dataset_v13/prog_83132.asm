; DESCRIPTION: Composite: Renders a magenta line between points (123, 146) and (419, 106) then Renders a white box of size 120x41 starting at (307, 101) then Sets a single magenta pixel at (387, 185).
; PLAN: r0=123(x1), r1=146(y1), r2=419(x2), r3=106(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=307(x), r6=101(y), r7=120(width), r8=41(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=387(x), r11=185(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 123
LDI r1, 146
LDI r2, 419
LDI r3, 106
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 307
LDI r6, 101
LDI r7, 120
LDI r8, 41
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 387
LDI r11, 185
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
