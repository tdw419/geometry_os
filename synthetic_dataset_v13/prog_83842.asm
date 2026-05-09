; DESCRIPTION: Renders a cyan line between points (45, 84) and (213, 253).
; PLAN: r0=45(x1), r1=84(y1), r2=213(x2), r3=253(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 84
LDI r2, 213
LDI r3, 253
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
