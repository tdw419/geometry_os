; DESCRIPTION: Renders a white line between points (173, 111) and (357, 236).
; PLAN: r0=173(x1), r1=111(y1), r2=357(x2), r3=236(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 111
LDI r2, 357
LDI r3, 236
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
