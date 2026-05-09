; DESCRIPTION: Renders a cyan line between points (400, 57) and (481, 154).
; PLAN: r0=400(x1), r1=57(y1), r2=481(x2), r3=154(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 57
LDI r2, 481
LDI r3, 154
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
