; DESCRIPTION: Composite: Creates a white circular shape at (415, 160) with radius 74 then Draws a cyan line from (252, 187) to (474, 47).
; PLAN: r0=415(x), r1=160(y), r2=74(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=252(x1), r6=187(y1), r7=474(x2), r8=47(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 415
LDI r1, 160
LDI r2, 74
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 252
LDI r6, 187
LDI r7, 474
LDI r8, 47
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
