; DESCRIPTION: Draws a cyan line from (261, 193) to (57, 82).
; PLAN: r0=261(x1), r1=193(y1), r2=57(x2), r3=82(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 193
LDI r2, 57
LDI r3, 82
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
