; DESCRIPTION: Composite: Places a black 82x120 rectangle at position (121, 82) then Renders a black disk with center (317, 82) and radius 70 then Draws a black line from (236, 236) to (261, 3).
; PLAN: r0=121(x), r1=82(y), r2=82(width), r3=120(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=317(x), r6=82(y), r7=70(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=236(x1), r11=236(y1), r12=261(x2), r13=3(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 121
LDI r1, 82
LDI r2, 82
LDI r3, 120
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 317
LDI r6, 82
LDI r7, 70
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 236
LDI r11, 236
LDI r12, 261
LDI r13, 3
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
