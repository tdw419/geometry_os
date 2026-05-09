; DESCRIPTION: Renders a cyan line between points (96, 21) and (161, 209).
; PLAN: r0=96(x1), r1=21(y1), r2=161(x2), r3=209(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 21
LDI r2, 161
LDI r3, 209
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
