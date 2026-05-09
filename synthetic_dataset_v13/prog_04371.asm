; DESCRIPTION: Draws a white line from (502, 172) to (107, 204).
; PLAN: r0=502(x1), r1=172(y1), r2=107(x2), r3=204(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 502
LDI r1, 172
LDI r2, 107
LDI r3, 204
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
