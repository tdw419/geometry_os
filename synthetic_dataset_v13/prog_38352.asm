; DESCRIPTION: Draws a white line from (415, 163) to (242, 101).
; PLAN: r0=415(x1), r1=163(y1), r2=242(x2), r3=101(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 163
LDI r2, 242
LDI r3, 101
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
