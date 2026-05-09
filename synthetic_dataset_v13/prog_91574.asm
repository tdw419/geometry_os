; DESCRIPTION: Renders a cyan line between points (80, 132) and (242, 253).
; PLAN: r0=80(x1), r1=132(y1), r2=242(x2), r3=253(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 132
LDI r2, 242
LDI r3, 253
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
