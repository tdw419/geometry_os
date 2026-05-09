; DESCRIPTION: Composite: Renders a purple box of size 88x109 starting at (195, 54) then Renders a blue disk with center (123, 57) and radius 32.
; PLAN: r0=195(x), r1=54(y), r2=88(width), r3=109(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=123(x), r6=57(y), r7=32(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 195
LDI r1, 54
LDI r2, 88
LDI r3, 109
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 123
LDI r6, 57
LDI r7, 32
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
