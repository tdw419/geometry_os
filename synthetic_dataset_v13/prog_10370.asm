; DESCRIPTION: Composite: Places a red 41x72 rectangle at position (54, 174) then Draws a black line from (283, 109) to (504, 197).
; PLAN: r0=54(x), r1=174(y), r2=41(width), r3=72(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=283(x1), r6=109(y1), r7=504(x2), r8=197(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 54
LDI r1, 174
LDI r2, 41
LDI r3, 72
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 283
LDI r6, 109
LDI r7, 504
LDI r8, 197
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
