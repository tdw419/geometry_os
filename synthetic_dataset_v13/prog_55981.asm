; DESCRIPTION: Composite: Renders a purple box of size 15x27 starting at (56, 96) then Places a purple line segment connecting (213, 114) to (349, 213) then Places a black dot at position (224, 212).
; PLAN: r0=56(x), r1=96(y), r2=15(width), r3=27(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=213(x1), r6=114(y1), r7=349(x2), r8=213(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=224(x), r11=212(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 56
LDI r1, 96
LDI r2, 15
LDI r3, 27
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 213
LDI r6, 114
LDI r7, 349
LDI r8, 213
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 224
LDI r11, 212
LDI r12, 0x000000
PSET r10, r11, r12
HALT
