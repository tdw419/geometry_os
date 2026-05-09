; DESCRIPTION: Composite: Places a white 72x115 rectangle at position (278, 28) then Draws a orange line from (314, 245) to (206, 198).
; PLAN: r0=278(x), r1=28(y), r2=72(width), r3=115(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=314(x1), r6=245(y1), r7=206(x2), r8=198(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 278
LDI r1, 28
LDI r2, 72
LDI r3, 115
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 314
LDI r6, 245
LDI r7, 206
LDI r8, 198
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
