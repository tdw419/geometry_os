; DESCRIPTION: Draws a cyan line from (98, 54) to (424, 108).
; PLAN: r0=98(x1), r1=54(y1), r2=424(x2), r3=108(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 54
LDI r2, 424
LDI r3, 108
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
