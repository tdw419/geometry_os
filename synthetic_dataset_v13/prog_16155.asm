; DESCRIPTION: Draws a red line from (40, 161) to (410, 27).
; PLAN: r0=40(x1), r1=161(y1), r2=410(x2), r3=27(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 161
LDI r2, 410
LDI r3, 27
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
