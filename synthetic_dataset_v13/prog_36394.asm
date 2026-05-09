; DESCRIPTION: Draws a white line from (206, 12) to (345, 195).
; PLAN: r0=206(x1), r1=12(y1), r2=345(x2), r3=195(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 12
LDI r2, 345
LDI r3, 195
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
