; DESCRIPTION: Draws a cyan line from (415, 0) to (419, 122).
; PLAN: r0=415(x1), r1=0(y1), r2=419(x2), r3=122(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 0
LDI r2, 419
LDI r3, 122
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
