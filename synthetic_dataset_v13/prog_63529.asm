; DESCRIPTION: Composite: Renders a black line between points (274, 44) and (6, 203) then Places a purple dot at position (230, 27) then Renders a purple box of size 20x96 starting at (193, 111).
; PLAN: r0=274(x1), r1=44(y1), r2=6(x2), r3=203(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=230(x), r6=27(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=193(x), r11=111(y), r12=20(width), r13=96(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 274
LDI r1, 44
LDI r2, 6
LDI r3, 203
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 230
LDI r6, 27
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 193
LDI r11, 111
LDI r12, 20
LDI r13, 96
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
