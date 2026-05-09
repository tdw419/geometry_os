; DESCRIPTION: Draws a red line from (240, 13) to (508, 215).
; PLAN: r0=240(x1), r1=13(y1), r2=508(x2), r3=215(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 13
LDI r2, 508
LDI r3, 215
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
