; DESCRIPTION: Draws a white line from (503, 116) to (487, 59).
; PLAN: r0=503(x1), r1=116(y1), r2=487(x2), r3=59(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 503
LDI r1, 116
LDI r2, 487
LDI r3, 59
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
