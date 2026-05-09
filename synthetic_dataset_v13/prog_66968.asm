; DESCRIPTION: Draws a cyan line from (101, 113) to (171, 25).
; PLAN: r0=101(x1), r1=113(y1), r2=171(x2), r3=25(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 113
LDI r2, 171
LDI r3, 25
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
