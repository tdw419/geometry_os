; DESCRIPTION: Composite: Sets a single white pixel at (111, 10) then Draws a blue line from (422, 160) to (498, 74) then Places a white 116x111 rectangle at position (157, 97).
; PLAN: r0=111(x), r1=10(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=422(x1), r6=160(y1), r7=498(x2), r8=74(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=157(x), r11=97(y), r12=116(width), r13=111(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 111
LDI r1, 10
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 422
LDI r6, 160
LDI r7, 498
LDI r8, 74
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 157
LDI r11, 97
LDI r12, 116
LDI r13, 111
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
