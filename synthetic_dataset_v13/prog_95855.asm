; DESCRIPTION: Renders a cyan line between points (323, 28) and (243, 48).
; PLAN: r0=323(x1), r1=28(y1), r2=243(x2), r3=48(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 28
LDI r2, 243
LDI r3, 48
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
