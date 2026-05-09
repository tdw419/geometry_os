; DESCRIPTION: Draws a cyan line from (500, 220) to (292, 214).
; PLAN: r0=500(x1), r1=220(y1), r2=292(x2), r3=214(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 500
LDI r1, 220
LDI r2, 292
LDI r3, 214
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
