; DESCRIPTION: Draws a white line from (298, 254) to (503, 104).
; PLAN: r0=298(x1), r1=254(y1), r2=503(x2), r3=104(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 254
LDI r2, 503
LDI r3, 104
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
