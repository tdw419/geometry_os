; DESCRIPTION: Draws a cyan line from (367, 200) to (306, 59).
; PLAN: r0=367(x1), r1=200(y1), r2=306(x2), r3=59(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 200
LDI r2, 306
LDI r3, 59
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
