; DESCRIPTION: Composite: Places a white dot at position (78, 190) then Places a orange circle of radius 16 at center (64, 70) then Places a blue 32x36 rectangle at position (175, 180).
; PLAN: r0=78(x), r1=190(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=64(x), r6=70(y), r7=16(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=175(x), r11=180(y), r12=32(width), r13=36(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 78
LDI r1, 190
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 64
LDI r6, 70
LDI r7, 16
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 175
LDI r11, 180
LDI r12, 32
LDI r13, 36
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
