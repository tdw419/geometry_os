; DESCRIPTION: Composite: Places a red line segment connecting (445, 25) to (266, 127) then Places a magenta dot at position (343, 183) then Places a yellow 102x12 rectangle at position (344, 182).
; PLAN: r0=445(x1), r1=25(y1), r2=266(x2), r3=127(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=343(x), r6=183(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=344(x), r11=182(y), r12=102(width), r13=12(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 445
LDI r1, 25
LDI r2, 266
LDI r3, 127
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 343
LDI r6, 183
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 344
LDI r11, 182
LDI r12, 102
LDI r13, 12
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
