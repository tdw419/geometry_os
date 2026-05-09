; DESCRIPTION: Draws a cyan line from (424, 120) to (299, 44).
; PLAN: r0=424(x1), r1=120(y1), r2=299(x2), r3=44(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 120
LDI r2, 299
LDI r3, 44
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
