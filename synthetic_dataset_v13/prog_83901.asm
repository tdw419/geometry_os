; DESCRIPTION: Draws a white line from (239, 137) to (397, 171).
; PLAN: r0=239(x1), r1=137(y1), r2=397(x2), r3=171(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 137
LDI r2, 397
LDI r3, 171
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
