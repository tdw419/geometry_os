; DESCRIPTION: Renders a cyan line between points (502, 142) and (222, 250).
; PLAN: r0=502(x1), r1=142(y1), r2=222(x2), r3=250(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 502
LDI r1, 142
LDI r2, 222
LDI r3, 250
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
