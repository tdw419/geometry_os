; DESCRIPTION: Composite: Renders a orange box of size 59x62 starting at (16, 185) then Renders a red disk with center (225, 146) and radius 54 then Sets a single orange pixel at (12, 40).
; PLAN: r0=16(x), r1=185(y), r2=59(width), r3=62(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=225(x), r6=146(y), r7=54(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=12(x), r11=40(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 16
LDI r1, 185
LDI r2, 59
LDI r3, 62
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 225
LDI r6, 146
LDI r7, 54
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 12
LDI r11, 40
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
