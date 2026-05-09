; DESCRIPTION: Composite: Places a cyan 22x24 rectangle at position (290, 82) then Draws a green line from (11, 82) to (401, 85) then Renders a white disk with center (123, 118) and radius 47.
; PLAN: r0=290(x), r1=82(y), r2=22(width), r3=24(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=11(x1), r6=82(y1), r7=401(x2), r8=85(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=123(x), r11=118(y), r12=47(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 290
LDI r1, 82
LDI r2, 22
LDI r3, 24
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 11
LDI r6, 82
LDI r7, 401
LDI r8, 85
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 123
LDI r11, 118
LDI r12, 47
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
