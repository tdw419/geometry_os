; DESCRIPTION: Draws a white line from (230, 173) to (259, 19).
; PLAN: r0=230(x1), r1=173(y1), r2=259(x2), r3=19(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 173
LDI r2, 259
LDI r3, 19
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
