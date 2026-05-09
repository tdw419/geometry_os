; DESCRIPTION: Places a cyan line segment connecting (143, 125) to (418, 230).
; PLAN: r0=143(x1), r1=125(y1), r2=418(x2), r3=230(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 125
LDI r2, 418
LDI r3, 230
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
