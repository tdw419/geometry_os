; DESCRIPTION: Composite: Renders a blue line between points (443, 146) and (262, 102) then Renders a red box of size 116x28 starting at (241, 65) then Sets a single blue pixel at (134, 200).
; PLAN: r0=443(x1), r1=146(y1), r2=262(x2), r3=102(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=241(x), r6=65(y), r7=116(width), r8=28(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=134(x), r11=200(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 443
LDI r1, 146
LDI r2, 262
LDI r3, 102
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 241
LDI r6, 65
LDI r7, 116
LDI r8, 28
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 134
LDI r11, 200
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
