; DESCRIPTION: Composite: Renders a white line between points (337, 205) and (123, 130) then Renders a orange box of size 59x48 starting at (317, 189) then Sets a single black pixel at (22, 209).
; PLAN: r0=337(x1), r1=205(y1), r2=123(x2), r3=130(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=317(x), r6=189(y), r7=59(width), r8=48(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=22(x), r11=209(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 337
LDI r1, 205
LDI r2, 123
LDI r3, 130
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 317
LDI r6, 189
LDI r7, 59
LDI r8, 48
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 22
LDI r11, 209
LDI r12, 0x000000
PSET r10, r11, r12
HALT
