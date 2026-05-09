; DESCRIPTION: Places a cyan line segment connecting (491, 105) to (415, 143).
; PLAN: r0=491(x1), r1=105(y1), r2=415(x2), r3=143(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 105
LDI r2, 415
LDI r3, 143
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
