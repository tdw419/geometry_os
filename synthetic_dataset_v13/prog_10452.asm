; DESCRIPTION: Composite: Places a red 103x33 rectangle at position (99, 37) then Renders a magenta disk with center (273, 180) and radius 17 then Renders a black line between points (159, 120) and (190, 91).
; PLAN: r0=99(x), r1=37(y), r2=103(width), r3=33(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=273(x), r6=180(y), r7=17(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=159(x1), r11=120(y1), r12=190(x2), r13=91(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 99
LDI r1, 37
LDI r2, 103
LDI r3, 33
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 273
LDI r6, 180
LDI r7, 17
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 159
LDI r11, 120
LDI r12, 190
LDI r13, 91
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
