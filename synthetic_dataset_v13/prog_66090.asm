; DESCRIPTION: Composite: Draws a orange circle centered at (209, 166) with radius 54 then Places a green dot at position (116, 120).
; PLAN: r0=209(x), r1=166(y), r2=54(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=116(x), r6=120(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 209
LDI r1, 166
LDI r2, 54
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 116
LDI r6, 120
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
