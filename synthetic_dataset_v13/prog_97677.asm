; DESCRIPTION: Renders a cyan line between points (381, 48) and (73, 243).
; PLAN: r0=381(x1), r1=48(y1), r2=73(x2), r3=243(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 48
LDI r2, 73
LDI r3, 243
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
