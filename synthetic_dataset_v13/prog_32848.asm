; DESCRIPTION: Composite: Draws a red rectangle at (252, 123) with width 63 and height 38 then Draws a cyan line from (290, 58) to (112, 163) then Sets a single white pixel at (466, 216).
; PLAN: r0=252(x), r1=123(y), r2=63(width), r3=38(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=290(x1), r6=58(y1), r7=112(x2), r8=163(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=466(x), r11=216(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 252
LDI r1, 123
LDI r2, 63
LDI r3, 38
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 290
LDI r6, 58
LDI r7, 112
LDI r8, 163
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 466
LDI r11, 216
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
