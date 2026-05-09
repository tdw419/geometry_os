; DESCRIPTION: Places a cyan line segment connecting (49, 107) to (47, 154).
; PLAN: r0=49(x1), r1=107(y1), r2=47(x2), r3=154(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 107
LDI r2, 47
LDI r3, 154
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
