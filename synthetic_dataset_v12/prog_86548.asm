; DESCRIPTION: Draws a red line from (405, 124) to (468, 208).
; PLAN: r0=405(x1), r1=124(y1), r2=468(x2), r3=208(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 124
LDI r2, 468
LDI r3, 208
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
