; DESCRIPTION: Composite: Sets a single black pixel at (396, 112) then Draws a orange rectangle at (345, 96) with width 98 and height 55 then Places a green line segment connecting (262, 44) to (405, 28).
; PLAN: r0=396(x), r1=112(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=345(x), r6=96(y), r7=98(width), r8=55(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=262(x1), r11=44(y1), r12=405(x2), r13=28(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 396
LDI r1, 112
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 345
LDI r6, 96
LDI r7, 98
LDI r8, 55
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 262
LDI r11, 44
LDI r12, 405
LDI r13, 28
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
