; DESCRIPTION: Draws a green line from (226, 125) to (135, 154).
; PLAN: r0=226(x1), r1=125(y1), r2=135(x2), r3=154(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 125
LDI r2, 135
LDI r3, 154
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
