; DESCRIPTION: Renders a cyan line between points (83, 249) and (294, 34).
; PLAN: r0=83(x1), r1=249(y1), r2=294(x2), r3=34(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 249
LDI r2, 294
LDI r3, 34
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
