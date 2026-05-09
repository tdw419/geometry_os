; DESCRIPTION: Composite: Places a red line segment connecting (151, 48) to (199, 13) then Places a white 66x41 rectangle at position (184, 69).
; PLAN: r0=151(x1), r1=48(y1), r2=199(x2), r3=13(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=184(x), r6=69(y), r7=66(width), r8=41(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 151
LDI r1, 48
LDI r2, 199
LDI r3, 13
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 184
LDI r6, 69
LDI r7, 66
LDI r8, 41
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
