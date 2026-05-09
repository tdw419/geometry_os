; DESCRIPTION: Draws a white line from (493, 103) to (376, 104).
; PLAN: r0=493(x1), r1=103(y1), r2=376(x2), r3=104(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 493
LDI r1, 103
LDI r2, 376
LDI r3, 104
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
