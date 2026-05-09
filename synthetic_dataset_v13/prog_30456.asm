; DESCRIPTION: Places a cyan line segment connecting (333, 142) to (309, 154).
; PLAN: r0=333(x1), r1=142(y1), r2=309(x2), r3=154(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 142
LDI r2, 309
LDI r3, 154
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
