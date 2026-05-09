; DESCRIPTION: Composite: Draws a cyan circle centered at (245, 36) with radius 36 then Sets a single yellow pixel at (405, 7) then Places a black 116x99 rectangle at position (328, 14).
; PLAN: r0=245(x), r1=36(y), r2=36(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=405(x), r6=7(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=328(x), r11=14(y), r12=116(width), r13=99(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 245
LDI r1, 36
LDI r2, 36
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 405
LDI r6, 7
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 328
LDI r11, 14
LDI r12, 116
LDI r13, 99
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
