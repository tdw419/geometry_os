; DESCRIPTION: Renders a cyan line between points (6, 238) and (405, 134).
; PLAN: r0=6(x1), r1=238(y1), r2=405(x2), r3=134(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 238
LDI r2, 405
LDI r3, 134
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
