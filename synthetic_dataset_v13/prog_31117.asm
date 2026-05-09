; DESCRIPTION: Composite: Places a black dot at position (445, 179) then Places a yellow 32x77 rectangle at position (182, 66) then Places a magenta line segment connecting (462, 97) to (60, 43).
; PLAN: r0=445(x), r1=179(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=182(x), r6=66(y), r7=32(width), r8=77(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=462(x1), r11=97(y1), r12=60(x2), r13=43(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 445
LDI r1, 179
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 182
LDI r6, 66
LDI r7, 32
LDI r8, 77
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 462
LDI r11, 97
LDI r12, 60
LDI r13, 43
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
