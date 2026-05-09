; DESCRIPTION: Draws a cyan line from (403, 241) to (296, 177).
; PLAN: r0=403(x1), r1=241(y1), r2=296(x2), r3=177(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 241
LDI r2, 296
LDI r3, 177
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
