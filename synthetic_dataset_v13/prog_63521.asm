; DESCRIPTION: Composite: Renders a white line between points (13, 171) and (165, 185) then Places a black 87x28 rectangle at position (7, 200).
; PLAN: r0=13(x1), r1=171(y1), r2=165(x2), r3=185(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=7(x), r6=200(y), r7=87(width), r8=28(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 13
LDI r1, 171
LDI r2, 165
LDI r3, 185
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 7
LDI r6, 200
LDI r7, 87
LDI r8, 28
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
