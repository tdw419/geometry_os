; DESCRIPTION: Renders a cyan line between points (83, 230) and (52, 126).
; PLAN: r0=83(x1), r1=230(y1), r2=52(x2), r3=126(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 230
LDI r2, 52
LDI r3, 126
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
