; DESCRIPTION: Draws a white line from (346, 4) to (288, 208).
; PLAN: r0=346(x1), r1=4(y1), r2=288(x2), r3=208(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 4
LDI r2, 288
LDI r3, 208
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
