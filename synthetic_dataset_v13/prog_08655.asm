; DESCRIPTION: Composite: Places a red circle of radius 33 at center (395, 120) then Sets a single white pixel at (15, 131) then Renders a green box of size 22x52 starting at (174, 165).
; PLAN: r0=395(x), r1=120(y), r2=33(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=15(x), r6=131(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=174(x), r11=165(y), r12=22(width), r13=52(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 395
LDI r1, 120
LDI r2, 33
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 15
LDI r6, 131
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 174
LDI r11, 165
LDI r12, 22
LDI r13, 52
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
