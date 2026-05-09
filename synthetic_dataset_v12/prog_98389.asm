; DESCRIPTION: Draws a cyan line from (87, 180) to (403, 245).
; PLAN: r0=87(x1), r1=180(y1), r2=403(x2), r3=245(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 180
LDI r2, 403
LDI r3, 245
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
