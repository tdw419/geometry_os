; DESCRIPTION: Draws a green line from (415, 48) to (221, 128).
; PLAN: r0=415(x1), r1=48(y1), r2=221(x2), r3=128(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 48
LDI r2, 221
LDI r3, 128
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
