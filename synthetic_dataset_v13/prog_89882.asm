; DESCRIPTION: Composite: Places a yellow line segment connecting (131, 193) to (210, 62) then Renders a white disk with center (279, 93) and radius 36 then Creates a cyan rectangular region at (73, 149) spanning 84 by 95 pixels.
; PLAN: r0=131(x1), r1=193(y1), r2=210(x2), r3=62(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=279(x), r6=93(y), r7=36(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=73(x), r11=149(y), r12=84(width), r13=95(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 131
LDI r1, 193
LDI r2, 210
LDI r3, 62
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 279
LDI r6, 93
LDI r7, 36
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 73
LDI r11, 149
LDI r12, 84
LDI r13, 95
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
