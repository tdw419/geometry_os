; DESCRIPTION: Renders a cyan line between points (212, 28) and (225, 154).
; PLAN: r0=212(x1), r1=28(y1), r2=225(x2), r3=154(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 28
LDI r2, 225
LDI r3, 154
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
