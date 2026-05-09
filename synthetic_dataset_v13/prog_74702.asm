; DESCRIPTION: Draws a white line from (502, 208) to (438, 40).
; PLAN: r0=502(x1), r1=208(y1), r2=438(x2), r3=40(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 502
LDI r1, 208
LDI r2, 438
LDI r3, 40
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
