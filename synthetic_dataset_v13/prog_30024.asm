; DESCRIPTION: Composite: Creates a orange circular shape at (303, 205) with radius 50 then Places a black dot at position (43, 123) then Places a cyan line segment connecting (11, 120) to (246, 103).
; PLAN: r0=303(x), r1=205(y), r2=50(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=43(x), r6=123(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=11(x1), r11=120(y1), r12=246(x2), r13=103(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 303
LDI r1, 205
LDI r2, 50
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 43
LDI r6, 123
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 11
LDI r11, 120
LDI r12, 246
LDI r13, 103
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
