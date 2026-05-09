; DESCRIPTION: Draws a white line from (305, 131) to (173, 180).
; PLAN: r0=305(x1), r1=131(y1), r2=173(x2), r3=180(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 131
LDI r2, 173
LDI r3, 180
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
