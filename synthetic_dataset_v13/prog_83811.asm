; DESCRIPTION: Composite: Renders a magenta line between points (117, 189) and (502, 95) then Places a magenta 108x21 rectangle at position (45, 153) then Places a red circle of radius 62 at center (393, 190).
; PLAN: r0=117(x1), r1=189(y1), r2=502(x2), r3=95(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=45(x), r6=153(y), r7=108(width), r8=21(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=393(x), r11=190(y), r12=62(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 117
LDI r1, 189
LDI r2, 502
LDI r3, 95
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 45
LDI r6, 153
LDI r7, 108
LDI r8, 21
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 393
LDI r11, 190
LDI r12, 62
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
