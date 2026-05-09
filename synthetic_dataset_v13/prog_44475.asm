; DESCRIPTION: Composite: Sets a single purple pixel at (419, 97) then Renders a orange disk with center (40, 161) and radius 19 then Renders a red box of size 84x97 starting at (374, 108).
; PLAN: r0=419(x), r1=97(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=40(x), r6=161(y), r7=19(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=374(x), r11=108(y), r12=84(width), r13=97(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 419
LDI r1, 97
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 40
LDI r6, 161
LDI r7, 19
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 374
LDI r11, 108
LDI r12, 84
LDI r13, 97
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
