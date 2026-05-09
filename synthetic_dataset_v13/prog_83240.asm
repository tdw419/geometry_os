; DESCRIPTION: Draws a cyan line from (451, 215) to (327, 2).
; PLAN: r0=451(x1), r1=215(y1), r2=327(x2), r3=2(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 215
LDI r2, 327
LDI r3, 2
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
