; DESCRIPTION: Composite: Sets a single orange pixel at (461, 235) then Renders a orange box of size 61x36 starting at (385, 183) then Renders a magenta line between points (268, 231) and (65, 231).
; PLAN: r0=461(x), r1=235(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=385(x), r6=183(y), r7=61(width), r8=36(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=268(x1), r11=231(y1), r12=65(x2), r13=231(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 461
LDI r1, 235
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 385
LDI r6, 183
LDI r7, 61
LDI r8, 36
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 268
LDI r11, 231
LDI r12, 65
LDI r13, 231
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
