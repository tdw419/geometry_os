; DESCRIPTION: Composite: Draws a green line from (31, 187) to (473, 57) then Places a black dot at position (276, 2) then Places a white 89x38 rectangle at position (130, 30).
; PLAN: r0=31(x1), r1=187(y1), r2=473(x2), r3=57(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=276(x), r6=2(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=130(x), r11=30(y), r12=89(width), r13=38(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 31
LDI r1, 187
LDI r2, 473
LDI r3, 57
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 276
LDI r6, 2
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 130
LDI r11, 30
LDI r12, 89
LDI r13, 38
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
