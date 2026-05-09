; DESCRIPTION: Renders a white line between points (242, 68) and (280, 154).
; PLAN: r0=242(x1), r1=68(y1), r2=280(x2), r3=154(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 68
LDI r2, 280
LDI r3, 154
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
