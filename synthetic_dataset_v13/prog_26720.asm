; DESCRIPTION: Renders a cyan line between points (371, 101) and (358, 67).
; PLAN: r0=371(x1), r1=101(y1), r2=358(x2), r3=67(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 101
LDI r2, 358
LDI r3, 67
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
