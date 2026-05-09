; DESCRIPTION: Composite: Sets a single yellow pixel at (39, 188) then Renders a magenta box of size 81x83 starting at (295, 86) then Places a black line segment connecting (134, 65) to (130, 174).
; PLAN: r0=39(x), r1=188(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=295(x), r6=86(y), r7=81(width), r8=83(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=134(x1), r11=65(y1), r12=130(x2), r13=174(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 39
LDI r1, 188
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 295
LDI r6, 86
LDI r7, 81
LDI r8, 83
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 134
LDI r11, 65
LDI r12, 130
LDI r13, 174
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
