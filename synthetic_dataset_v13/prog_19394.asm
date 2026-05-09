; DESCRIPTION: Composite: Places a white line segment connecting (317, 172) to (322, 223) then Places a red 100x69 rectangle at position (27, 121).
; PLAN: r0=317(x1), r1=172(y1), r2=322(x2), r3=223(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=27(x), r6=121(y), r7=100(width), r8=69(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 317
LDI r1, 172
LDI r2, 322
LDI r3, 223
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 27
LDI r6, 121
LDI r7, 100
LDI r8, 69
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
