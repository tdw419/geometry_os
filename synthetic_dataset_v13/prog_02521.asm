; DESCRIPTION: Renders a white line between points (228, 156) and (392, 82).
; PLAN: r0=228(x1), r1=156(y1), r2=392(x2), r3=82(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 156
LDI r2, 392
LDI r3, 82
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
