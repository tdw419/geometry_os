; DESCRIPTION: Draws a cyan line from (221, 58) to (214, 245).
; PLAN: r0=221(x1), r1=58(y1), r2=214(x2), r3=245(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 58
LDI r2, 214
LDI r3, 245
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
