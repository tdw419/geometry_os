; DESCRIPTION: Composite: Renders a magenta box of size 99x22 starting at (148, 91) then Places a white dot at position (397, 187) then Renders a black line between points (92, 110) and (459, 213).
; PLAN: r0=148(x), r1=91(y), r2=99(width), r3=22(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=397(x), r6=187(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=92(x1), r11=110(y1), r12=459(x2), r13=213(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 148
LDI r1, 91
LDI r2, 99
LDI r3, 22
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 397
LDI r6, 187
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 92
LDI r11, 110
LDI r12, 459
LDI r13, 213
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
