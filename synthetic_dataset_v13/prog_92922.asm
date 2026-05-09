; DESCRIPTION: Composite: Draws a black line from (294, 80) to (67, 14) then Places a red 49x32 rectangle at position (199, 114) then Places a black dot at position (108, 174).
; PLAN: r0=294(x1), r1=80(y1), r2=67(x2), r3=14(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=199(x), r6=114(y), r7=49(width), r8=32(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=108(x), r11=174(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 294
LDI r1, 80
LDI r2, 67
LDI r3, 14
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 199
LDI r6, 114
LDI r7, 49
LDI r8, 32
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 108
LDI r11, 174
LDI r12, 0x000000
PSET r10, r11, r12
HALT
