; DESCRIPTION: Renders a cyan line between points (335, 195) and (373, 154).
; PLAN: r0=335(x1), r1=195(y1), r2=373(x2), r3=154(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 195
LDI r2, 373
LDI r3, 154
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
