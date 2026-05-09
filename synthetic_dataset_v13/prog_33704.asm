; DESCRIPTION: Composite: Places a white line segment connecting (285, 200) to (82, 51) then Places a yellow 47x76 rectangle at position (113, 20).
; PLAN: r0=285(x1), r1=200(y1), r2=82(x2), r3=51(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=113(x), r6=20(y), r7=47(width), r8=76(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 285
LDI r1, 200
LDI r2, 82
LDI r3, 51
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 113
LDI r6, 20
LDI r7, 47
LDI r8, 76
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
