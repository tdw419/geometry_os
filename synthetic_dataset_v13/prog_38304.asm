; DESCRIPTION: Draws a white line from (117, 45) to (197, 208).
; PLAN: r0=117(x1), r1=45(y1), r2=197(x2), r3=208(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 45
LDI r2, 197
LDI r3, 208
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
