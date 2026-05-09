; DESCRIPTION: Composite: Renders a magenta disk with center (130, 243) and radius 10 then Sets a single red pixel at (255, 55) then Renders a purple box of size 28x76 starting at (348, 69).
; PLAN: r0=130(x), r1=243(y), r2=10(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=255(x), r6=55(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=348(x), r11=69(y), r12=28(width), r13=76(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 130
LDI r1, 243
LDI r2, 10
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 255
LDI r6, 55
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 348
LDI r11, 69
LDI r12, 28
LDI r13, 76
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
