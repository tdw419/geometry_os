; DESCRIPTION: Renders a cyan line between points (247, 0) and (435, 192).
; PLAN: r0=247(x1), r1=0(y1), r2=435(x2), r3=192(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 0
LDI r2, 435
LDI r3, 192
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
