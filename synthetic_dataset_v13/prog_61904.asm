; DESCRIPTION: Draws a white line from (503, 186) to (92, 164).
; PLAN: r0=503(x1), r1=186(y1), r2=92(x2), r3=164(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 503
LDI r1, 186
LDI r2, 92
LDI r3, 164
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
