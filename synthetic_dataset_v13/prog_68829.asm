; DESCRIPTION: Composite: Renders a white disk with center (61, 158) and radius 48 then Draws a magenta line from (4, 201) to (434, 81) then Places a orange 23x80 rectangle at position (243, 154).
; PLAN: r0=61(x), r1=158(y), r2=48(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=4(x1), r6=201(y1), r7=434(x2), r8=81(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=243(x), r11=154(y), r12=23(width), r13=80(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 61
LDI r1, 158
LDI r2, 48
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 4
LDI r6, 201
LDI r7, 434
LDI r8, 81
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 243
LDI r11, 154
LDI r12, 23
LDI r13, 80
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
