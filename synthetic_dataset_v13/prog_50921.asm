; DESCRIPTION: Composite: Places a orange circle of radius 51 at center (64, 106) then Sets a single orange pixel at (173, 255) then Renders a cyan box of size 21x43 starting at (298, 161).
; PLAN: r0=64(x), r1=106(y), r2=51(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=173(x), r6=255(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=298(x), r11=161(y), r12=21(width), r13=43(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 64
LDI r1, 106
LDI r2, 51
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 173
LDI r6, 255
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 298
LDI r11, 161
LDI r12, 21
LDI r13, 43
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
