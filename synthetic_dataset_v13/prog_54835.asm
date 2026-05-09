; DESCRIPTION: Composite: Draws a red circle centered at (100, 118) with radius 76 then Renders a red line between points (502, 244) and (269, 109) then Places a cyan 113x78 rectangle at position (228, 53).
; PLAN: r0=100(x), r1=118(y), r2=76(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=502(x1), r6=244(y1), r7=269(x2), r8=109(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=228(x), r11=53(y), r12=113(width), r13=78(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 100
LDI r1, 118
LDI r2, 76
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 502
LDI r6, 244
LDI r7, 269
LDI r8, 109
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 228
LDI r11, 53
LDI r12, 113
LDI r13, 78
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
