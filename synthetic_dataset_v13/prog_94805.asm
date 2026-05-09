; DESCRIPTION: Composite: Places a orange dot at position (346, 126) then Places a red line segment connecting (492, 181) to (134, 227) then Places a cyan 31x25 rectangle at position (460, 144).
; PLAN: r0=346(x), r1=126(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=492(x1), r6=181(y1), r7=134(x2), r8=227(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=460(x), r11=144(y), r12=31(width), r13=25(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 346
LDI r1, 126
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 492
LDI r6, 181
LDI r7, 134
LDI r8, 227
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 460
LDI r11, 144
LDI r12, 31
LDI r13, 25
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
