; DESCRIPTION: Draws a red line from (171, 16) to (168, 225).
; PLAN: r0=171(x1), r1=16(y1), r2=168(x2), r3=225(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 16
LDI r2, 168
LDI r3, 225
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
