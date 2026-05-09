; DESCRIPTION: Composite: Places a magenta 26x14 rectangle at position (425, 135) then Draws a black line from (88, 133) to (178, 210).
; PLAN: r0=425(x), r1=135(y), r2=26(width), r3=14(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=88(x1), r6=133(y1), r7=178(x2), r8=210(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 425
LDI r1, 135
LDI r2, 26
LDI r3, 14
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 88
LDI r6, 133
LDI r7, 178
LDI r8, 210
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
