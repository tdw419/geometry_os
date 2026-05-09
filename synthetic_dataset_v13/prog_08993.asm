; DESCRIPTION: Places a green line segment connecting (42, 17) to (111, 154).
; PLAN: r0=42(x1), r1=17(y1), r2=111(x2), r3=154(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 17
LDI r2, 111
LDI r3, 154
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
