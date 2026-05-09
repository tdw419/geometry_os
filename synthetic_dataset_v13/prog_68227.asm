; DESCRIPTION: Composite: Places a cyan circle of radius 71 at center (392, 184) then Sets a single green pixel at (349, 88) then Places a red 58x23 rectangle at position (366, 223).
; PLAN: r0=392(x), r1=184(y), r2=71(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=349(x), r6=88(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=366(x), r11=223(y), r12=58(width), r13=23(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 392
LDI r1, 184
LDI r2, 71
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 349
LDI r6, 88
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 366
LDI r11, 223
LDI r12, 58
LDI r13, 23
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
