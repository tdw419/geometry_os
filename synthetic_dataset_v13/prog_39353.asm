; DESCRIPTION: Composite: Renders a yellow line between points (456, 169) and (445, 213) then Places a yellow dot at position (284, 203) then Renders a yellow box of size 90x69 starting at (377, 169).
; PLAN: r0=456(x1), r1=169(y1), r2=445(x2), r3=213(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=284(x), r6=203(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=377(x), r11=169(y), r12=90(width), r13=69(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 456
LDI r1, 169
LDI r2, 445
LDI r3, 213
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 284
LDI r6, 203
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 377
LDI r11, 169
LDI r12, 90
LDI r13, 69
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
