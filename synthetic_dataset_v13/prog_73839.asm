; DESCRIPTION: Draws a cyan line from (204, 124) to (225, 249).
; PLAN: r0=204(x1), r1=124(y1), r2=225(x2), r3=249(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 124
LDI r2, 225
LDI r3, 249
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
