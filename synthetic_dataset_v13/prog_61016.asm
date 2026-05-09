; DESCRIPTION: Renders a cyan line between points (508, 218) and (371, 113).
; PLAN: r0=508(x1), r1=218(y1), r2=371(x2), r3=113(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 508
LDI r1, 218
LDI r2, 371
LDI r3, 113
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
