; DESCRIPTION: Renders a cyan line between points (494, 120) and (290, 37).
; PLAN: r0=494(x1), r1=120(y1), r2=290(x2), r3=37(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 494
LDI r1, 120
LDI r2, 290
LDI r3, 37
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
