; DESCRIPTION: Draws a cyan line from (237, 233) to (385, 156).
; PLAN: r0=237(x1), r1=233(y1), r2=385(x2), r3=156(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 233
LDI r2, 385
LDI r3, 156
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
