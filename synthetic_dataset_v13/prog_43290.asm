; DESCRIPTION: Composite: Renders a white line between points (65, 103) and (376, 23) then Places a green 108x102 rectangle at position (277, 10) then Sets a single black pixel at (385, 211).
; PLAN: r0=65(x1), r1=103(y1), r2=376(x2), r3=23(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=277(x), r6=10(y), r7=108(width), r8=102(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=385(x), r11=211(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 65
LDI r1, 103
LDI r2, 376
LDI r3, 23
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 277
LDI r6, 10
LDI r7, 108
LDI r8, 102
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 385
LDI r11, 211
LDI r12, 0x000000
PSET r10, r11, r12
HALT
