; DESCRIPTION: Renders a cyan line between points (13, 44) and (48, 87).
; PLAN: r0=13(x1), r1=44(y1), r2=48(x2), r3=87(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 44
LDI r2, 48
LDI r3, 87
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
