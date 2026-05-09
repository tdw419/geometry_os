; DESCRIPTION: Draws a cyan line from (313, 171) to (56, 129).
; PLAN: r0=313(x1), r1=171(y1), r2=56(x2), r3=129(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 171
LDI r2, 56
LDI r3, 129
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
