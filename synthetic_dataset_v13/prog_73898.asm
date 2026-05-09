; DESCRIPTION: Draws a white line from (167, 50) to (366, 173).
; PLAN: r0=167(x1), r1=50(y1), r2=366(x2), r3=173(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 50
LDI r2, 366
LDI r3, 173
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
