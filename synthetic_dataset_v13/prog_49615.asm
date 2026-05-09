; DESCRIPTION: Composite: Places a cyan dot at position (59, 14) then Places a blue line segment connecting (375, 51) to (449, 220) then Places a purple 92x11 rectangle at position (420, 35).
; PLAN: r0=59(x), r1=14(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=375(x1), r6=51(y1), r7=449(x2), r8=220(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=420(x), r11=35(y), r12=92(width), r13=11(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 59
LDI r1, 14
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 375
LDI r6, 51
LDI r7, 449
LDI r8, 220
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 420
LDI r11, 35
LDI r12, 92
LDI r13, 11
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
