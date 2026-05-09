; DESCRIPTION: Renders a cyan line between points (291, 56) and (475, 154).
; PLAN: r0=291(x1), r1=56(y1), r2=475(x2), r3=154(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 56
LDI r2, 475
LDI r3, 154
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
