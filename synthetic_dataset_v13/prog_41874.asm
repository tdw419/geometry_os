; DESCRIPTION: Draws a white line from (210, 120) to (248, 152).
; PLAN: r0=210(x1), r1=120(y1), r2=248(x2), r3=152(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 120
LDI r2, 248
LDI r3, 152
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
