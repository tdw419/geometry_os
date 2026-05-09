; DESCRIPTION: Composite: Sets a single white pixel at (428, 107) then Renders a orange box of size 106x58 starting at (94, 86) then Renders a blue line between points (452, 183) and (189, 16).
; PLAN: r0=428(x), r1=107(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=94(x), r6=86(y), r7=106(width), r8=58(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=452(x1), r11=183(y1), r12=189(x2), r13=16(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 428
LDI r1, 107
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 94
LDI r6, 86
LDI r7, 106
LDI r8, 58
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 452
LDI r11, 183
LDI r12, 189
LDI r13, 16
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
