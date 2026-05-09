; DESCRIPTION: Composite: Places a black dot at position (201, 112) then Places a magenta 14x53 rectangle at position (255, 76) then Draws a cyan line from (286, 45) to (54, 73).
; PLAN: r0=201(x), r1=112(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=255(x), r6=76(y), r7=14(width), r8=53(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=286(x1), r11=45(y1), r12=54(x2), r13=73(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 201
LDI r1, 112
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 255
LDI r6, 76
LDI r7, 14
LDI r8, 53
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 286
LDI r11, 45
LDI r12, 54
LDI r13, 73
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
