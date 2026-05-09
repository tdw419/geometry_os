; DESCRIPTION: Draws a black line from (103, 82) to (495, 117).
; PLAN: r0=103(x1), r1=82(y1), r2=495(x2), r3=117(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 82
LDI r2, 495
LDI r3, 117
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
