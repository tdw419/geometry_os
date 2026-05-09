; DESCRIPTION: Composite: Places a red dot at position (23, 78) then Creates a magenta rectangular region at (317, 14) spanning 30 by 110 pixels then Renders a magenta disk with center (305, 161) and radius 41.
; PLAN: r0=23(x), r1=78(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=317(x), r6=14(y), r7=30(width), r8=110(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=305(x), r11=161(y), r12=41(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 23
LDI r1, 78
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 317
LDI r6, 14
LDI r7, 30
LDI r8, 110
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 305
LDI r11, 161
LDI r12, 41
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
