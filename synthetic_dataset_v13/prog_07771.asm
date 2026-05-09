; DESCRIPTION: Draws a cyan line from (124, 79) to (59, 51).
; PLAN: r0=124(x1), r1=79(y1), r2=59(x2), r3=51(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 79
LDI r2, 59
LDI r3, 51
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
