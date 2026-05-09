; DESCRIPTION: Draws a cyan line from (446, 131) to (316, 131).
; PLAN: r0=446(x1), r1=131(y1), r2=316(x2), r3=131(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 131
LDI r2, 316
LDI r3, 131
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
