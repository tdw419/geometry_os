; DESCRIPTION: Draws a white line from (167, 95) to (382, 126).
; PLAN: r0=167(x1), r1=95(y1), r2=382(x2), r3=126(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 95
LDI r2, 382
LDI r3, 126
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
