; DESCRIPTION: Draws a white line from (32, 179) to (204, 215).
; PLAN: r0=32(x1), r1=179(y1), r2=204(x2), r3=215(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 179
LDI r2, 204
LDI r3, 215
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
