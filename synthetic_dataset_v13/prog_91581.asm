; DESCRIPTION: Draws a cyan line from (218, 202) to (293, 241).
; PLAN: r0=218(x1), r1=202(y1), r2=293(x2), r3=241(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 202
LDI r2, 293
LDI r3, 241
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
