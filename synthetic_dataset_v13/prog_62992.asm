; DESCRIPTION: Composite: Creates a blue circular shape at (385, 34) with radius 20 then Places a red dot at position (40, 213) then Renders a blue box of size 99x77 starting at (10, 79).
; PLAN: r0=385(x), r1=34(y), r2=20(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=40(x), r6=213(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=10(x), r11=79(y), r12=99(width), r13=77(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 385
LDI r1, 34
LDI r2, 20
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 40
LDI r6, 213
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 10
LDI r11, 79
LDI r12, 99
LDI r13, 77
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
