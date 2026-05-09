; DESCRIPTION: Places a cyan line segment connecting (428, 206) to (238, 107).
; PLAN: r0=428(x1), r1=206(y1), r2=238(x2), r3=107(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 206
LDI r2, 238
LDI r3, 107
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
