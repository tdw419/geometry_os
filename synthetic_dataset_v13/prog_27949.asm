; DESCRIPTION: Composite: Places a orange line segment connecting (199, 111) to (297, 79) then Places a green 53x40 rectangle at position (226, 14).
; PLAN: r0=199(x1), r1=111(y1), r2=297(x2), r3=79(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=226(x), r6=14(y), r7=53(width), r8=40(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 199
LDI r1, 111
LDI r2, 297
LDI r3, 79
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 226
LDI r6, 14
LDI r7, 53
LDI r8, 40
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
