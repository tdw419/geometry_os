; DESCRIPTION: Draws a cyan line from (382, 225) to (74, 218).
; PLAN: r0=382(x1), r1=225(y1), r2=74(x2), r3=218(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 225
LDI r2, 74
LDI r3, 218
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
