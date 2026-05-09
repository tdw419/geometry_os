; DESCRIPTION: Renders a cyan line between points (202, 45) and (121, 250).
; PLAN: r0=202(x1), r1=45(y1), r2=121(x2), r3=250(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 45
LDI r2, 121
LDI r3, 250
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
