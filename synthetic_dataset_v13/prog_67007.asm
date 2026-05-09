; DESCRIPTION: Composite: Places a blue 10x37 rectangle at position (190, 49) then Renders a blue line between points (303, 227) and (368, 187).
; PLAN: r0=190(x), r1=49(y), r2=10(width), r3=37(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=303(x1), r6=227(y1), r7=368(x2), r8=187(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 190
LDI r1, 49
LDI r2, 10
LDI r3, 37
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 303
LDI r6, 227
LDI r7, 368
LDI r8, 187
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
