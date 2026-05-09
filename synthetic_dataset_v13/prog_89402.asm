; DESCRIPTION: Renders a cyan line between points (94, 50) and (243, 154).
; PLAN: r0=94(x1), r1=50(y1), r2=243(x2), r3=154(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 50
LDI r2, 243
LDI r3, 154
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
