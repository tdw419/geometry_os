; DESCRIPTION: Composite: Renders a cyan box of size 50x71 starting at (112, 141) then Draws a white line from (185, 169) to (337, 222).
; PLAN: r0=112(x), r1=141(y), r2=50(width), r3=71(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=185(x1), r6=169(y1), r7=337(x2), r8=222(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 112
LDI r1, 141
LDI r2, 50
LDI r3, 71
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 185
LDI r6, 169
LDI r7, 337
LDI r8, 222
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
