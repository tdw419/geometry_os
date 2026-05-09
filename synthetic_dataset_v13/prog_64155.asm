; DESCRIPTION: Draws a cyan line from (122, 92) to (127, 124).
; PLAN: r0=122(x1), r1=92(y1), r2=127(x2), r3=124(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 92
LDI r2, 127
LDI r3, 124
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
