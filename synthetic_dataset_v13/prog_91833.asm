; DESCRIPTION: Composite: Places a orange line segment connecting (202, 34) to (206, 73) then Places a red dot at position (228, 30) then Places a orange 76x104 rectangle at position (217, 43).
; PLAN: r0=202(x1), r1=34(y1), r2=206(x2), r3=73(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=228(x), r6=30(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=217(x), r11=43(y), r12=76(width), r13=104(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 202
LDI r1, 34
LDI r2, 206
LDI r3, 73
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 228
LDI r6, 30
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 217
LDI r11, 43
LDI r12, 76
LDI r13, 104
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
