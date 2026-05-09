; DESCRIPTION: Composite: Renders a magenta line between points (416, 1) and (92, 108) then Renders a yellow box of size 120x111 starting at (172, 48) then Renders a green disk with center (410, 81) and radius 26.
; PLAN: r0=416(x1), r1=1(y1), r2=92(x2), r3=108(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=172(x), r6=48(y), r7=120(width), r8=111(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=410(x), r11=81(y), r12=26(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 416
LDI r1, 1
LDI r2, 92
LDI r3, 108
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 172
LDI r6, 48
LDI r7, 120
LDI r8, 111
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 410
LDI r11, 81
LDI r12, 26
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
