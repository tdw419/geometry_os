; DESCRIPTION: Draws a green line from (420, 220) to (415, 172).
; PLAN: r0=420(x1), r1=220(y1), r2=415(x2), r3=172(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 220
LDI r2, 415
LDI r3, 172
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
