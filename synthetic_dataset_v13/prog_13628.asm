; DESCRIPTION: Composite: Places a white 15x28 rectangle at position (239, 173) then Places a white line segment connecting (196, 100) to (30, 254).
; PLAN: r0=239(x), r1=173(y), r2=15(width), r3=28(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=196(x1), r6=100(y1), r7=30(x2), r8=254(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 239
LDI r1, 173
LDI r2, 15
LDI r3, 28
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 196
LDI r6, 100
LDI r7, 30
LDI r8, 254
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
