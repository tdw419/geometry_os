; DESCRIPTION: Draws a cyan line from (376, 61) to (313, 91).
; PLAN: r0=376(x1), r1=61(y1), r2=313(x2), r3=91(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 61
LDI r2, 313
LDI r3, 91
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
