; DESCRIPTION: Composite: Renders a yellow line between points (264, 47) and (335, 135) then Places a red 14x62 rectangle at position (277, 154) then Sets a single yellow pixel at (365, 136).
; PLAN: r0=264(x1), r1=47(y1), r2=335(x2), r3=135(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=277(x), r6=154(y), r7=14(width), r8=62(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=365(x), r11=136(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 264
LDI r1, 47
LDI r2, 335
LDI r3, 135
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 277
LDI r6, 154
LDI r7, 14
LDI r8, 62
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 365
LDI r11, 136
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
