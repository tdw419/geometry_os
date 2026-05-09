; DESCRIPTION: Renders a cyan line between points (352, 204) and (387, 188).
; PLAN: r0=352(x1), r1=204(y1), r2=387(x2), r3=188(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 204
LDI r2, 387
LDI r3, 188
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
