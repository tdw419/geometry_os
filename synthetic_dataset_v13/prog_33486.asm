; DESCRIPTION: Composite: Draws a magenta line from (430, 163) to (394, 117) then Renders a cyan disk with center (64, 170) and radius 43 then Renders a blue box of size 66x18 starting at (383, 15).
; PLAN: r0=430(x1), r1=163(y1), r2=394(x2), r3=117(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=64(x), r6=170(y), r7=43(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=383(x), r11=15(y), r12=66(width), r13=18(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 430
LDI r1, 163
LDI r2, 394
LDI r3, 117
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 64
LDI r6, 170
LDI r7, 43
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 383
LDI r11, 15
LDI r12, 66
LDI r13, 18
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
