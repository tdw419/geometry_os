; DESCRIPTION: Draws a cyan line from (95, 249) to (385, 232).
; PLAN: r0=95(x1), r1=249(y1), r2=385(x2), r3=232(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 249
LDI r2, 385
LDI r3, 232
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
