; DESCRIPTION: Composite: Draws a red rectangle at (311, 79) with width 26 and height 117 then Places a cyan circle of radius 13 at center (313, 132).
; PLAN: r0=311(x), r1=79(y), r2=26(width), r3=117(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=313(x), r6=132(y), r7=13(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 311
LDI r1, 79
LDI r2, 26
LDI r3, 117
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 313
LDI r6, 132
LDI r7, 13
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
