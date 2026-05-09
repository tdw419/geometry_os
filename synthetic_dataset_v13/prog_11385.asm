; DESCRIPTION: Composite: Draws a green line from (339, 50) to (247, 42) then Creates a red rectangular region at (95, 45) spanning 109 by 18 pixels then Places a blue dot at position (290, 56).
; PLAN: r0=339(x1), r1=50(y1), r2=247(x2), r3=42(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=95(x), r6=45(y), r7=109(width), r8=18(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=290(x), r11=56(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 339
LDI r1, 50
LDI r2, 247
LDI r3, 42
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 95
LDI r6, 45
LDI r7, 109
LDI r8, 18
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 290
LDI r11, 56
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
