; DESCRIPTION: Composite: Renders a purple disk with center (342, 57) and radius 24 then Renders a red box of size 43x95 starting at (196, 14) then Sets a single white pixel at (260, 34).
; PLAN: r0=342(x), r1=57(y), r2=24(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=196(x), r6=14(y), r7=43(width), r8=95(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=260(x), r11=34(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 342
LDI r1, 57
LDI r2, 24
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 196
LDI r6, 14
LDI r7, 43
LDI r8, 95
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 260
LDI r11, 34
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
