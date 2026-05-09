; DESCRIPTION: Composite: Renders a orange box of size 108x52 starting at (81, 42) then Draws a purple line from (276, 104) to (367, 19) then Places a magenta dot at position (2, 126).
; PLAN: r0=81(x), r1=42(y), r2=108(width), r3=52(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=276(x1), r6=104(y1), r7=367(x2), r8=19(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=2(x), r11=126(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 81
LDI r1, 42
LDI r2, 108
LDI r3, 52
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 276
LDI r6, 104
LDI r7, 367
LDI r8, 19
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 2
LDI r11, 126
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
