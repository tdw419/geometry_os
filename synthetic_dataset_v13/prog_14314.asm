; DESCRIPTION: Composite: Places a yellow circle of radius 67 at center (133, 152) then Draws a orange line from (305, 203) to (79, 87).
; PLAN: r0=133(x), r1=152(y), r2=67(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=305(x1), r6=203(y1), r7=79(x2), r8=87(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 133
LDI r1, 152
LDI r2, 67
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 305
LDI r6, 203
LDI r7, 79
LDI r8, 87
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
