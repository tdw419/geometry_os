; DESCRIPTION: Composite: Renders a white disk with center (415, 133) and radius 60 then Renders a magenta line between points (81, 24) and (398, 162) then Places a yellow 86x117 rectangle at position (412, 10).
; PLAN: r0=415(x), r1=133(y), r2=60(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=81(x1), r6=24(y1), r7=398(x2), r8=162(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=412(x), r11=10(y), r12=86(width), r13=117(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 415
LDI r1, 133
LDI r2, 60
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 81
LDI r6, 24
LDI r7, 398
LDI r8, 162
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 412
LDI r11, 10
LDI r12, 86
LDI r13, 117
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
