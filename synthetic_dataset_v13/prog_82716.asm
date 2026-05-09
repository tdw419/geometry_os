; DESCRIPTION: Renders a green line between points (225, 214) and (313, 236).
; PLAN: r0=225(x1), r1=214(y1), r2=313(x2), r3=236(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 214
LDI r2, 313
LDI r3, 236
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
