; DESCRIPTION: Composite: Creates a cyan rectangular region at (214, 24) spanning 42 by 85 pixels then Places a cyan line segment connecting (59, 164) to (149, 25) then Sets a single black pixel at (80, 112).
; PLAN: r0=214(x), r1=24(y), r2=42(width), r3=85(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=59(x1), r6=164(y1), r7=149(x2), r8=25(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=80(x), r11=112(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 214
LDI r1, 24
LDI r2, 42
LDI r3, 85
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 59
LDI r6, 164
LDI r7, 149
LDI r8, 25
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 80
LDI r11, 112
LDI r12, 0x000000
PSET r10, r11, r12
HALT
