; DESCRIPTION: Renders a cyan line between points (448, 64) and (384, 208).
; PLAN: r0=448(x1), r1=64(y1), r2=384(x2), r3=208(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 64
LDI r2, 384
LDI r3, 208
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
