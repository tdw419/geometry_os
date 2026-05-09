; DESCRIPTION: Draws a cyan line from (293, 161) to (313, 214).
; PLAN: r0=293(x1), r1=161(y1), r2=313(x2), r3=214(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 161
LDI r2, 313
LDI r3, 214
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
