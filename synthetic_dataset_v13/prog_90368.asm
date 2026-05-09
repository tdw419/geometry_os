; DESCRIPTION: Composite: Creates a purple circular shape at (281, 106) with radius 77 then Renders a green box of size 51x120 starting at (35, 108) then Places a green line segment connecting (322, 181) to (370, 48).
; PLAN: r0=281(x), r1=106(y), r2=77(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=35(x), r6=108(y), r7=51(width), r8=120(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=322(x1), r11=181(y1), r12=370(x2), r13=48(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 281
LDI r1, 106
LDI r2, 77
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 35
LDI r6, 108
LDI r7, 51
LDI r8, 120
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 322
LDI r11, 181
LDI r12, 370
LDI r13, 48
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
