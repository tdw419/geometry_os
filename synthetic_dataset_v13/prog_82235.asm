; DESCRIPTION: Draws a cyan line from (225, 177) to (124, 82).
; PLAN: r0=225(x1), r1=177(y1), r2=124(x2), r3=82(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 177
LDI r2, 124
LDI r3, 82
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
