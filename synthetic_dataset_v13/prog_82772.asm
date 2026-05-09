; DESCRIPTION: Draws a red line from (171, 195) to (108, 138).
; PLAN: r0=171(x1), r1=195(y1), r2=108(x2), r3=138(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 195
LDI r2, 108
LDI r3, 138
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
