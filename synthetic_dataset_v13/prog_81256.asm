; DESCRIPTION: Composite: Renders a red box of size 42x70 starting at (359, 169) then Sets a single purple pixel at (446, 220) then Places a red circle of radius 44 at center (60, 100).
; PLAN: r0=359(x), r1=169(y), r2=42(width), r3=70(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=446(x), r6=220(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=60(x), r11=100(y), r12=44(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 359
LDI r1, 169
LDI r2, 42
LDI r3, 70
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 446
LDI r6, 220
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 60
LDI r11, 100
LDI r12, 44
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
