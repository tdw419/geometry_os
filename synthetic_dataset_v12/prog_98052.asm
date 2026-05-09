; DESCRIPTION: Renders a cyan line between points (368, 76) and (207, 153).
; PLAN: r0=368(x1), r1=76(y1), r2=207(x2), r3=153(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 76
LDI r2, 207
LDI r3, 153
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
