; DESCRIPTION: Renders a cyan line between points (341, 1) and (72, 195).
; PLAN: r0=341(x1), r1=1(y1), r2=72(x2), r3=195(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 1
LDI r2, 72
LDI r3, 195
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
