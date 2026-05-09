; DESCRIPTION: Composite: Places a purple line segment connecting (66, 221) to (217, 111) then Sets a single purple pixel at (150, 245) then Renders a orange box of size 99x39 starting at (11, 21).
; PLAN: r0=66(x1), r1=221(y1), r2=217(x2), r3=111(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=150(x), r6=245(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=11(x), r11=21(y), r12=99(width), r13=39(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 66
LDI r1, 221
LDI r2, 217
LDI r3, 111
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 150
LDI r6, 245
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 11
LDI r11, 21
LDI r12, 99
LDI r13, 39
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
