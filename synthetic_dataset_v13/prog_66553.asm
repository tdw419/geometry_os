; DESCRIPTION: Composite: Places a white circle of radius 10 at center (376, 241) then Places a cyan line segment connecting (373, 55) to (262, 99) then Places a red 116x59 rectangle at position (393, 14).
; PLAN: r0=376(x), r1=241(y), r2=10(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=373(x1), r6=55(y1), r7=262(x2), r8=99(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=393(x), r11=14(y), r12=116(width), r13=59(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 376
LDI r1, 241
LDI r2, 10
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 373
LDI r6, 55
LDI r7, 262
LDI r8, 99
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 393
LDI r11, 14
LDI r12, 116
LDI r13, 59
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
