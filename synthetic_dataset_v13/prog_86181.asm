; DESCRIPTION: Composite: Places a red dot at position (443, 230) then Places a orange 80x96 rectangle at position (5, 88) then Renders a red line between points (154, 131) and (103, 223).
; PLAN: r0=443(x), r1=230(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=5(x), r6=88(y), r7=80(width), r8=96(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=154(x1), r11=131(y1), r12=103(x2), r13=223(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 443
LDI r1, 230
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 5
LDI r6, 88
LDI r7, 80
LDI r8, 96
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 154
LDI r11, 131
LDI r12, 103
LDI r13, 223
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
