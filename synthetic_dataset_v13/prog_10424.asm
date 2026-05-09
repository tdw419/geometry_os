; DESCRIPTION: Draws a cyan line from (403, 248) to (31, 62).
; PLAN: r0=403(x1), r1=248(y1), r2=31(x2), r3=62(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 248
LDI r2, 31
LDI r3, 62
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
