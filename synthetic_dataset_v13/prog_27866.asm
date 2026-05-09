; DESCRIPTION: Composite: Draws a green line from (495, 191) to (469, 121) then Places a green dot at position (319, 76) then Places a cyan 60x116 rectangle at position (182, 108).
; PLAN: r0=495(x1), r1=191(y1), r2=469(x2), r3=121(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=319(x), r6=76(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=182(x), r11=108(y), r12=60(width), r13=116(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 495
LDI r1, 191
LDI r2, 469
LDI r3, 121
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 319
LDI r6, 76
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 182
LDI r11, 108
LDI r12, 60
LDI r13, 116
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
