; DESCRIPTION: Composite: Renders a cyan box of size 103x26 starting at (214, 8) then Draws a blue line from (169, 177) to (15, 251).
; PLAN: r0=214(x), r1=8(y), r2=103(width), r3=26(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=169(x1), r6=177(y1), r7=15(x2), r8=251(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 214
LDI r1, 8
LDI r2, 103
LDI r3, 26
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 169
LDI r6, 177
LDI r7, 15
LDI r8, 251
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
