; DESCRIPTION: Draws a white line from (371, 39) to (227, 209).
; PLAN: r0=371(x1), r1=39(y1), r2=227(x2), r3=209(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 39
LDI r2, 227
LDI r3, 209
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
