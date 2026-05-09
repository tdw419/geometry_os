; DESCRIPTION: Composite: Renders a orange box of size 46x15 starting at (387, 51) then Places a white line segment connecting (132, 104) to (332, 220).
; PLAN: r0=387(x), r1=51(y), r2=46(width), r3=15(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=132(x1), r6=104(y1), r7=332(x2), r8=220(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 387
LDI r1, 51
LDI r2, 46
LDI r3, 15
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 132
LDI r6, 104
LDI r7, 332
LDI r8, 220
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
