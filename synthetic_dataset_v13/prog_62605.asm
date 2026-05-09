; DESCRIPTION: Renders a cyan line between points (39, 79) and (64, 72).
; PLAN: r0=39(x1), r1=79(y1), r2=64(x2), r3=72(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 79
LDI r2, 64
LDI r3, 72
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
