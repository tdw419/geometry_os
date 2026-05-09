; DESCRIPTION: Composite: Places a purple 69x116 rectangle at position (283, 46) then Renders a red line between points (182, 9) and (455, 95).
; PLAN: r0=283(x), r1=46(y), r2=69(width), r3=116(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=182(x1), r6=9(y1), r7=455(x2), r8=95(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 283
LDI r1, 46
LDI r2, 69
LDI r3, 116
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 182
LDI r6, 9
LDI r7, 455
LDI r8, 95
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
