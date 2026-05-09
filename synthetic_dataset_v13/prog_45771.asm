; DESCRIPTION: Composite: Places a purple 55x95 rectangle at position (406, 93) then Creates a red circular shape at (355, 113) with radius 33 then Renders a purple line between points (50, 208) and (337, 231).
; PLAN: r0=406(x), r1=93(y), r2=55(width), r3=95(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=355(x), r6=113(y), r7=33(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=50(x1), r11=208(y1), r12=337(x2), r13=231(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 406
LDI r1, 93
LDI r2, 55
LDI r3, 95
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 355
LDI r6, 113
LDI r7, 33
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 50
LDI r11, 208
LDI r12, 337
LDI r13, 231
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
