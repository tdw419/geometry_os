; DESCRIPTION: Places a cyan line segment connecting (341, 82) to (217, 57).
; PLAN: r0=341(x1), r1=82(y1), r2=217(x2), r3=57(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 82
LDI r2, 217
LDI r3, 57
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
