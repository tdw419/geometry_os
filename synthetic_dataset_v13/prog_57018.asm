; DESCRIPTION: Composite: Renders a purple box of size 67x85 starting at (169, 116) then Sets a single red pixel at (284, 32) then Renders a white disk with center (346, 133) and radius 12.
; PLAN: r0=169(x), r1=116(y), r2=67(width), r3=85(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=284(x), r6=32(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=346(x), r11=133(y), r12=12(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 169
LDI r1, 116
LDI r2, 67
LDI r3, 85
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 284
LDI r6, 32
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 346
LDI r11, 133
LDI r12, 12
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
