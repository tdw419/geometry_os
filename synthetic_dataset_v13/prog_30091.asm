; DESCRIPTION: Composite: Places a white 70x70 rectangle at position (151, 30) then Renders a white line between points (457, 189) and (244, 12).
; PLAN: r0=151(x), r1=30(y), r2=70(width), r3=70(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=457(x1), r6=189(y1), r7=244(x2), r8=12(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 151
LDI r1, 30
LDI r2, 70
LDI r3, 70
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 457
LDI r6, 189
LDI r7, 244
LDI r8, 12
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
