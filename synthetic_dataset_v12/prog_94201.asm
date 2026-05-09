; DESCRIPTION: Draws a white line from (484, 209) to (333, 19).
; PLAN: r0=484(x1), r1=209(y1), r2=333(x2), r3=19(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 209
LDI r2, 333
LDI r3, 19
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
