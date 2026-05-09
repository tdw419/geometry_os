; DESCRIPTION: Renders a cyan line between points (27, 135) and (124, 154).
; PLAN: r0=27(x1), r1=135(y1), r2=124(x2), r3=154(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 135
LDI r2, 124
LDI r3, 154
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
