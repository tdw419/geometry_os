; DESCRIPTION: Places a cyan line segment connecting (146, 37) to (334, 154).
; PLAN: r0=146(x1), r1=37(y1), r2=334(x2), r3=154(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 37
LDI r2, 334
LDI r3, 154
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
