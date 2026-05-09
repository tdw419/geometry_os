; DESCRIPTION: Composite: Renders a blue disk with center (377, 90) and radius 50 then Sets a single red pixel at (445, 40) then Creates a yellow rectangular region at (338, 70) spanning 75 by 93 pixels.
; PLAN: r0=377(x), r1=90(y), r2=50(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=445(x), r6=40(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=338(x), r11=70(y), r12=75(width), r13=93(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 377
LDI r1, 90
LDI r2, 50
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 445
LDI r6, 40
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 338
LDI r11, 70
LDI r12, 75
LDI r13, 93
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
