; DESCRIPTION: Composite: Sets a single yellow pixel at (197, 175) then Draws a magenta line from (423, 204) to (224, 60) then Renders a green box of size 18x58 starting at (260, 61).
; PLAN: r0=197(x), r1=175(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=423(x1), r6=204(y1), r7=224(x2), r8=60(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=260(x), r11=61(y), r12=18(width), r13=58(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 197
LDI r1, 175
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 423
LDI r6, 204
LDI r7, 224
LDI r8, 60
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 260
LDI r11, 61
LDI r12, 18
LDI r13, 58
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
