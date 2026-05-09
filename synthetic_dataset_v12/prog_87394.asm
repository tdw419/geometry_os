; DESCRIPTION: Renders a cyan line between points (274, 48) and (160, 1).
; PLAN: r0=274(x1), r1=48(y1), r2=160(x2), r3=1(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 48
LDI r2, 160
LDI r3, 1
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
