; DESCRIPTION: Places a white line segment connecting (373, 111) to (177, 154).
; PLAN: r0=373(x1), r1=111(y1), r2=177(x2), r3=154(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 111
LDI r2, 177
LDI r3, 154
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
