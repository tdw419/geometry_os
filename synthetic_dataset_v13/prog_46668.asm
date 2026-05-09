; DESCRIPTION: Composite: Renders a cyan disk with center (154, 110) and radius 12 then Places a red dot at position (207, 234) then Places a blue line segment connecting (168, 44) to (476, 224).
; PLAN: r0=154(x), r1=110(y), r2=12(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=207(x), r6=234(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=168(x1), r11=44(y1), r12=476(x2), r13=224(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 154
LDI r1, 110
LDI r2, 12
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 207
LDI r6, 234
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 168
LDI r11, 44
LDI r12, 476
LDI r13, 224
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
