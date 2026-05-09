; DESCRIPTION: Composite: Places a cyan circle of radius 37 at center (471, 81) then Draws a orange rectangle at (208, 79) with width 120 and height 85.
; PLAN: r0=471(x), r1=81(y), r2=37(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=208(x), r6=79(y), r7=120(width), r8=85(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 471
LDI r1, 81
LDI r2, 37
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 208
LDI r6, 79
LDI r7, 120
LDI r8, 85
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
