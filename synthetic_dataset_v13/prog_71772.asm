; DESCRIPTION: Renders a white line between points (98, 116) and (307, 236).
; PLAN: r0=98(x1), r1=116(y1), r2=307(x2), r3=236(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 116
LDI r2, 307
LDI r3, 236
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
