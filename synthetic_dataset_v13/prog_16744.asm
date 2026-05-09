; DESCRIPTION: Draws a white line from (312, 239) to (463, 113).
; PLAN: r0=312(x1), r1=239(y1), r2=463(x2), r3=113(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 239
LDI r2, 463
LDI r3, 113
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
