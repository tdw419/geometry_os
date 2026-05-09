; DESCRIPTION: Composite: Places a blue 120x56 rectangle at position (74, 166) then Sets a single magenta pixel at (34, 231) then Renders a green line between points (328, 96) and (495, 165).
; PLAN: r0=74(x), r1=166(y), r2=120(width), r3=56(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=34(x), r6=231(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=328(x1), r11=96(y1), r12=495(x2), r13=165(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 74
LDI r1, 166
LDI r2, 120
LDI r3, 56
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 34
LDI r6, 231
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 328
LDI r11, 96
LDI r12, 495
LDI r13, 165
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
