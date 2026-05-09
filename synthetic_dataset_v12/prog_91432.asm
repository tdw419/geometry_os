; DESCRIPTION: Composite: Creates a white circular shape at (264, 116) with radius 72 then Places a magenta 50x80 rectangle at position (402, 124) then Renders a cyan line between points (47, 223) and (474, 15).
; PLAN: r0=264(x), r1=116(y), r2=72(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=402(x), r6=124(y), r7=50(width), r8=80(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=47(x1), r11=223(y1), r12=474(x2), r13=15(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 264
LDI r1, 116
LDI r2, 72
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 402
LDI r6, 124
LDI r7, 50
LDI r8, 80
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 47
LDI r11, 223
LDI r12, 474
LDI r13, 15
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
