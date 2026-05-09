; DESCRIPTION: Composite: Draws a white line from (244, 102) to (136, 196) then Places a black 19x28 rectangle at position (484, 113).
; PLAN: r0=244(x1), r1=102(y1), r2=136(x2), r3=196(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=484(x), r6=113(y), r7=19(width), r8=28(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 244
LDI r1, 102
LDI r2, 136
LDI r3, 196
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 484
LDI r6, 113
LDI r7, 19
LDI r8, 28
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
