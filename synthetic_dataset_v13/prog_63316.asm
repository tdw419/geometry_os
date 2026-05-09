; DESCRIPTION: Composite: Draws a orange rectangle at (12, 145) with width 38 and height 87 then Places a green dot at position (253, 249).
; PLAN: r0=12(x), r1=145(y), r2=38(width), r3=87(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=253(x), r6=249(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 12
LDI r1, 145
LDI r2, 38
LDI r3, 87
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 253
LDI r6, 249
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
