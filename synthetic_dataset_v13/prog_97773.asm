; DESCRIPTION: Draws a cyan line from (93, 38) to (460, 244).
; PLAN: r0=93(x1), r1=38(y1), r2=460(x2), r3=244(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 38
LDI r2, 460
LDI r3, 244
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
