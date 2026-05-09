; DESCRIPTION: Composite: Places a red dot at position (510, 163) then Places a yellow line segment connecting (331, 191) to (8, 96) then Places a yellow 108x53 rectangle at position (174, 190).
; PLAN: r0=510(x), r1=163(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=331(x1), r6=191(y1), r7=8(x2), r8=96(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=174(x), r11=190(y), r12=108(width), r13=53(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 510
LDI r1, 163
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 331
LDI r6, 191
LDI r7, 8
LDI r8, 96
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 174
LDI r11, 190
LDI r12, 108
LDI r13, 53
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
