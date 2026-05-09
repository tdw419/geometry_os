; DESCRIPTION: Composite: Draws a blue line from (321, 158) to (126, 141) then Renders a cyan box of size 23x92 starting at (416, 55).
; PLAN: r0=321(x1), r1=158(y1), r2=126(x2), r3=141(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=416(x), r6=55(y), r7=23(width), r8=92(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 321
LDI r1, 158
LDI r2, 126
LDI r3, 141
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 416
LDI r6, 55
LDI r7, 23
LDI r8, 92
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
