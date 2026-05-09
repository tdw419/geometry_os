; DESCRIPTION: Composite: Places a green line segment connecting (125, 254) to (182, 140) then Renders a cyan disk with center (327, 115) and radius 58 then Creates a red rectangular region at (105, 19) spanning 56 by 96 pixels.
; PLAN: r0=125(x1), r1=254(y1), r2=182(x2), r3=140(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=327(x), r6=115(y), r7=58(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=105(x), r11=19(y), r12=56(width), r13=96(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 125
LDI r1, 254
LDI r2, 182
LDI r3, 140
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 327
LDI r6, 115
LDI r7, 58
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 105
LDI r11, 19
LDI r12, 56
LDI r13, 96
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
