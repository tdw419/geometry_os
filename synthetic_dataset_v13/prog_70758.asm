; DESCRIPTION: Draws a cyan line from (466, 234) to (360, 146).
; PLAN: r0=466(x1), r1=234(y1), r2=360(x2), r3=146(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 234
LDI r2, 360
LDI r3, 146
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
