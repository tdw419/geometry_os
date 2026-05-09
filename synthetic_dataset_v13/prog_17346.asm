; DESCRIPTION: Composite: Places a red dot at position (420, 83) then Renders a white line between points (95, 117) and (33, 169) then Places a orange 76x111 rectangle at position (9, 48).
; PLAN: r0=420(x), r1=83(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=95(x1), r6=117(y1), r7=33(x2), r8=169(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=9(x), r11=48(y), r12=76(width), r13=111(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 420
LDI r1, 83
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 95
LDI r6, 117
LDI r7, 33
LDI r8, 169
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 9
LDI r11, 48
LDI r12, 76
LDI r13, 111
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
