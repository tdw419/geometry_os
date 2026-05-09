; DESCRIPTION: Composite: Renders a cyan box of size 109x36 starting at (1, 123) then Draws a red line from (294, 138) to (231, 188) then Places a orange dot at position (209, 92).
; PLAN: r0=1(x), r1=123(y), r2=109(width), r3=36(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=294(x1), r6=138(y1), r7=231(x2), r8=188(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=209(x), r11=92(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 1
LDI r1, 123
LDI r2, 109
LDI r3, 36
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 294
LDI r6, 138
LDI r7, 231
LDI r8, 188
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 209
LDI r11, 92
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
