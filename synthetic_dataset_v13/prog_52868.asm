; DESCRIPTION: Places a white line segment connecting (186, 228) to (84, 154).
; PLAN: r0=186(x1), r1=228(y1), r2=84(x2), r3=154(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 228
LDI r2, 84
LDI r3, 154
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
