; DESCRIPTION: Composite: Draws a yellow rectangle at (106, 175) with width 34 and height 74 then Sets a single cyan pixel at (268, 141).
; PLAN: r0=106(x), r1=175(y), r2=34(width), r3=74(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=268(x), r6=141(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 106
LDI r1, 175
LDI r2, 34
LDI r3, 74
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 268
LDI r6, 141
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
