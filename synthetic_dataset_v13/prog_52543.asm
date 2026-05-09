; DESCRIPTION: Renders a cyan line between points (368, 28) and (507, 31).
; PLAN: r0=368(x1), r1=28(y1), r2=507(x2), r3=31(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 28
LDI r2, 507
LDI r3, 31
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
