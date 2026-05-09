; DESCRIPTION: Composite: Places a white 88x102 rectangle at position (349, 55) then Renders a red disk with center (339, 191) and radius 54 then Sets a single orange pixel at (433, 33).
; PLAN: r0=349(x), r1=55(y), r2=88(width), r3=102(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=339(x), r6=191(y), r7=54(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=433(x), r11=33(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 349
LDI r1, 55
LDI r2, 88
LDI r3, 102
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 339
LDI r6, 191
LDI r7, 54
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 433
LDI r11, 33
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
