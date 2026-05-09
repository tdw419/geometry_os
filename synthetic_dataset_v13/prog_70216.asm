; DESCRIPTION: Renders a cyan line between points (294, 30) and (73, 250).
; PLAN: r0=294(x1), r1=30(y1), r2=73(x2), r3=250(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 30
LDI r2, 73
LDI r3, 250
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
