; DESCRIPTION: Composite: Places a magenta dot at position (244, 18) then Places a black 110x120 rectangle at position (98, 11) then Renders a red line between points (290, 12) and (301, 232).
; PLAN: r0=244(x), r1=18(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=98(x), r6=11(y), r7=110(width), r8=120(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=290(x1), r11=12(y1), r12=301(x2), r13=232(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 244
LDI r1, 18
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 98
LDI r6, 11
LDI r7, 110
LDI r8, 120
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 290
LDI r11, 12
LDI r12, 301
LDI r13, 232
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
