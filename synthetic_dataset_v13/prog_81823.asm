; DESCRIPTION: Composite: Renders a red line between points (99, 165) and (377, 132) then Places a purple dot at position (330, 136) then Places a blue 92x33 rectangle at position (38, 154).
; PLAN: r0=99(x1), r1=165(y1), r2=377(x2), r3=132(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=330(x), r6=136(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=38(x), r11=154(y), r12=92(width), r13=33(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 99
LDI r1, 165
LDI r2, 377
LDI r3, 132
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 330
LDI r6, 136
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 38
LDI r11, 154
LDI r12, 92
LDI r13, 33
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
