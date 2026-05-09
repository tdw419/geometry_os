; DESCRIPTION: Renders a cyan line between points (324, 16) and (236, 250).
; PLAN: r0=324(x1), r1=16(y1), r2=236(x2), r3=250(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 16
LDI r2, 236
LDI r3, 250
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
