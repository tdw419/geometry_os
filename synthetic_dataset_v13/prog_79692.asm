; DESCRIPTION: Composite: Draws a blue line from (112, 30) to (315, 125) then Places a white 51x14 rectangle at position (331, 22).
; PLAN: r0=112(x1), r1=30(y1), r2=315(x2), r3=125(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=331(x), r6=22(y), r7=51(width), r8=14(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 112
LDI r1, 30
LDI r2, 315
LDI r3, 125
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 331
LDI r6, 22
LDI r7, 51
LDI r8, 14
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
