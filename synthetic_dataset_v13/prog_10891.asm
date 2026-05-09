; DESCRIPTION: Renders a cyan line between points (175, 78) and (401, 154).
; PLAN: r0=175(x1), r1=78(y1), r2=401(x2), r3=154(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 78
LDI r2, 401
LDI r3, 154
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
