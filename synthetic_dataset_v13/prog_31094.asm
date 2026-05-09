; DESCRIPTION: Renders a cyan line between points (0, 250) and (198, 178).
; PLAN: r0=0(x1), r1=250(y1), r2=198(x2), r3=178(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 250
LDI r2, 198
LDI r3, 178
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
