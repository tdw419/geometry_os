; DESCRIPTION: Draws a white line from (213, 253) to (209, 142).
; PLAN: r0=213(x1), r1=253(y1), r2=209(x2), r3=142(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 253
LDI r2, 209
LDI r3, 142
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
