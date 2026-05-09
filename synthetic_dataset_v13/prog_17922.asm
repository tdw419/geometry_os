; DESCRIPTION: Composite: Sets a single green pixel at (169, 146) then Places a purple 70x72 rectangle at position (403, 64) then Draws a white line from (6, 41) to (7, 95).
; PLAN: r0=169(x), r1=146(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=403(x), r6=64(y), r7=70(width), r8=72(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=6(x1), r11=41(y1), r12=7(x2), r13=95(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 169
LDI r1, 146
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 403
LDI r6, 64
LDI r7, 70
LDI r8, 72
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 6
LDI r11, 41
LDI r12, 7
LDI r13, 95
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
