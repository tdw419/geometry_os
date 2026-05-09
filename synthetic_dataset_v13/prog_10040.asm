; DESCRIPTION: Composite: Sets a single blue pixel at (169, 3) then Draws a cyan line from (460, 12) to (199, 250) then Places a cyan 16x110 rectangle at position (391, 14).
; PLAN: r0=169(x), r1=3(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=460(x1), r6=12(y1), r7=199(x2), r8=250(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=391(x), r11=14(y), r12=16(width), r13=110(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 169
LDI r1, 3
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 460
LDI r6, 12
LDI r7, 199
LDI r8, 250
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 391
LDI r11, 14
LDI r12, 16
LDI r13, 110
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
