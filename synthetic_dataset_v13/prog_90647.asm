; DESCRIPTION: Composite: Renders a red line between points (183, 30) and (8, 98) then Places a yellow dot at position (46, 116) then Renders a yellow box of size 50x98 starting at (47, 98).
; PLAN: r0=183(x1), r1=30(y1), r2=8(x2), r3=98(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=46(x), r6=116(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=47(x), r11=98(y), r12=50(width), r13=98(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 183
LDI r1, 30
LDI r2, 8
LDI r3, 98
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 46
LDI r6, 116
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 47
LDI r11, 98
LDI r12, 50
LDI r13, 98
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
