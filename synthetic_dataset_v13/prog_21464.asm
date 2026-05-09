; DESCRIPTION: Composite: Renders a black disk with center (400, 192) and radius 27 then Places a green dot at position (363, 190) then Places a purple 50x85 rectangle at position (56, 33).
; PLAN: r0=400(x), r1=192(y), r2=27(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=363(x), r6=190(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=56(x), r11=33(y), r12=50(width), r13=85(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 400
LDI r1, 192
LDI r2, 27
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 363
LDI r6, 190
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 56
LDI r11, 33
LDI r12, 50
LDI r13, 85
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
