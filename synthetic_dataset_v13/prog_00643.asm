; DESCRIPTION: Composite: Sets a single purple pixel at (493, 128) then Renders a orange disk with center (453, 80) and radius 52 then Renders a orange box of size 63x91 starting at (71, 162).
; PLAN: r0=493(x), r1=128(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=453(x), r6=80(y), r7=52(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=71(x), r11=162(y), r12=63(width), r13=91(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 493
LDI r1, 128
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 453
LDI r6, 80
LDI r7, 52
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 71
LDI r11, 162
LDI r12, 63
LDI r13, 91
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
