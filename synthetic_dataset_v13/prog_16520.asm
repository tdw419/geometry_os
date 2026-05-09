; DESCRIPTION: Composite: Renders a white line between points (4, 150) and (53, 150) then Renders a white box of size 44x106 starting at (298, 101).
; PLAN: r0=4(x1), r1=150(y1), r2=53(x2), r3=150(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=298(x), r6=101(y), r7=44(width), r8=106(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 4
LDI r1, 150
LDI r2, 53
LDI r3, 150
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 298
LDI r6, 101
LDI r7, 44
LDI r8, 106
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
