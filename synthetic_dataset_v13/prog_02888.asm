; DESCRIPTION: Composite: Places a orange line segment connecting (334, 152) to (264, 18) then Sets a single purple pixel at (5, 242) then Places a cyan 71x38 rectangle at position (419, 32).
; PLAN: r0=334(x1), r1=152(y1), r2=264(x2), r3=18(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=5(x), r6=242(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=419(x), r11=32(y), r12=71(width), r13=38(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 334
LDI r1, 152
LDI r2, 264
LDI r3, 18
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 5
LDI r6, 242
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 419
LDI r11, 32
LDI r12, 71
LDI r13, 38
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
