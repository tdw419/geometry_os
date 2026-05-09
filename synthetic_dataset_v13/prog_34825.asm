; DESCRIPTION: Composite: Renders a white line between points (100, 58) and (335, 35) then Renders a yellow box of size 71x38 starting at (166, 7) then Places a red dot at position (32, 71).
; PLAN: r0=100(x1), r1=58(y1), r2=335(x2), r3=35(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=166(x), r6=7(y), r7=71(width), r8=38(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=32(x), r11=71(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 100
LDI r1, 58
LDI r2, 335
LDI r3, 35
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 166
LDI r6, 7
LDI r7, 71
LDI r8, 38
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 32
LDI r11, 71
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
