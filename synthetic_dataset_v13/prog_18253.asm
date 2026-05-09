; DESCRIPTION: Draws a white line from (173, 222) to (415, 48).
; PLAN: r0=173(x1), r1=222(y1), r2=415(x2), r3=48(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 222
LDI r2, 415
LDI r3, 48
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
