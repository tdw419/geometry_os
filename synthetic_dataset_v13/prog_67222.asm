; DESCRIPTION: Composite: Sets a single yellow pixel at (292, 214) then Renders a cyan line between points (423, 240) and (507, 190) then Places a red 12x112 rectangle at position (88, 62).
; PLAN: r0=292(x), r1=214(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=423(x1), r6=240(y1), r7=507(x2), r8=190(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=88(x), r11=62(y), r12=12(width), r13=112(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 292
LDI r1, 214
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 423
LDI r6, 240
LDI r7, 507
LDI r8, 190
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 88
LDI r11, 62
LDI r12, 12
LDI r13, 112
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
