; DESCRIPTION: Renders a cyan line between points (500, 248) and (387, 233).
; PLAN: r0=500(x1), r1=248(y1), r2=387(x2), r3=233(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 500
LDI r1, 248
LDI r2, 387
LDI r3, 233
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
