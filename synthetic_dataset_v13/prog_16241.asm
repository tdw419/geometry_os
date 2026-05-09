; DESCRIPTION: Draws a cyan line from (283, 36) to (120, 167).
; PLAN: r0=283(x1), r1=36(y1), r2=120(x2), r3=167(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 36
LDI r2, 120
LDI r3, 167
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
