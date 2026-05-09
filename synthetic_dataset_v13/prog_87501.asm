; DESCRIPTION: Draws a red line from (27, 33) to (117, 171).
; PLAN: r0=27(x1), r1=33(y1), r2=117(x2), r3=171(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 33
LDI r2, 117
LDI r3, 171
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
