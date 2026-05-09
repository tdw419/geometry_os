; DESCRIPTION: Composite: Creates a yellow rectangular region at (277, 42) spanning 82 by 13 pixels then Renders a white line between points (389, 206) and (6, 62) then Sets a single orange pixel at (73, 161).
; PLAN: r0=277(x), r1=42(y), r2=82(width), r3=13(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=389(x1), r6=206(y1), r7=6(x2), r8=62(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=73(x), r11=161(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 277
LDI r1, 42
LDI r2, 82
LDI r3, 13
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 389
LDI r6, 206
LDI r7, 6
LDI r8, 62
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 73
LDI r11, 161
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
