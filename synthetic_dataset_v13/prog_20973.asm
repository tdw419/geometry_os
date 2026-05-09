; DESCRIPTION: Draws a cyan line from (385, 248) to (324, 57).
; PLAN: r0=385(x1), r1=248(y1), r2=324(x2), r3=57(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 248
LDI r2, 324
LDI r3, 57
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
