; DESCRIPTION: Places a cyan line segment connecting (135, 17) to (82, 24).
; PLAN: r0=135(x1), r1=17(y1), r2=82(x2), r3=24(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 17
LDI r2, 82
LDI r3, 24
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
