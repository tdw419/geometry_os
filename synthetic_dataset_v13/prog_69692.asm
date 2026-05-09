; DESCRIPTION: Draws a cyan line from (117, 219) to (125, 124).
; PLAN: r0=117(x1), r1=219(y1), r2=125(x2), r3=124(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 219
LDI r2, 125
LDI r3, 124
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
