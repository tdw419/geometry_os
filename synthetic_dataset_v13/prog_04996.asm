; DESCRIPTION: Renders a cyan line between points (242, 96) and (376, 124).
; PLAN: r0=242(x1), r1=96(y1), r2=376(x2), r3=124(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 96
LDI r2, 376
LDI r3, 124
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
