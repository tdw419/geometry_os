; DESCRIPTION: Draws a cyan line from (154, 236) to (368, 124).
; PLAN: r0=154(x1), r1=236(y1), r2=368(x2), r3=124(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 236
LDI r2, 368
LDI r3, 124
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
