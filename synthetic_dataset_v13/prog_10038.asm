; DESCRIPTION: Composite: Places a magenta dot at position (330, 122) then Renders a orange line between points (162, 176) and (437, 253) then Renders a cyan box of size 71x62 starting at (187, 127).
; PLAN: r0=330(x), r1=122(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=162(x1), r6=176(y1), r7=437(x2), r8=253(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=187(x), r11=127(y), r12=71(width), r13=62(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 330
LDI r1, 122
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 162
LDI r6, 176
LDI r7, 437
LDI r8, 253
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 187
LDI r11, 127
LDI r12, 71
LDI r13, 62
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
