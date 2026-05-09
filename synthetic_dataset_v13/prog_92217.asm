; DESCRIPTION: Composite: Renders a orange box of size 65x117 starting at (415, 55) then Renders a red line between points (263, 171) and (7, 116).
; PLAN: r0=415(x), r1=55(y), r2=65(width), r3=117(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=263(x1), r6=171(y1), r7=7(x2), r8=116(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 415
LDI r1, 55
LDI r2, 65
LDI r3, 117
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 263
LDI r6, 171
LDI r7, 7
LDI r8, 116
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
