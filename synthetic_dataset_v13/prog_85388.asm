; DESCRIPTION: Composite: Places a white circle of radius 58 at center (135, 156) then Places a yellow 100x55 rectangle at position (320, 7).
; PLAN: r0=135(x), r1=156(y), r2=58(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=320(x), r6=7(y), r7=100(width), r8=55(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 135
LDI r1, 156
LDI r2, 58
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 320
LDI r6, 7
LDI r7, 100
LDI r8, 55
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
