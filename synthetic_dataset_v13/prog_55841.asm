; DESCRIPTION: Composite: Draws a red rectangle at (93, 180) with width 85 and height 44 then Places a red dot at position (23, 1) then Places a white line segment connecting (245, 10) to (373, 37).
; PLAN: r0=93(x), r1=180(y), r2=85(width), r3=44(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=23(x), r6=1(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=245(x1), r11=10(y1), r12=373(x2), r13=37(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 93
LDI r1, 180
LDI r2, 85
LDI r3, 44
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 23
LDI r6, 1
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 245
LDI r11, 10
LDI r12, 373
LDI r13, 37
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
