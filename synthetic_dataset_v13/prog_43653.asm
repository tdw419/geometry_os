; DESCRIPTION: Composite: Renders a green box of size 96x65 starting at (206, 28) then Draws a yellow line from (322, 0) to (190, 191).
; PLAN: r0=206(x), r1=28(y), r2=96(width), r3=65(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=322(x1), r6=0(y1), r7=190(x2), r8=191(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 206
LDI r1, 28
LDI r2, 96
LDI r3, 65
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 322
LDI r6, 0
LDI r7, 190
LDI r8, 191
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
