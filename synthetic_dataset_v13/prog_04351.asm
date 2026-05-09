; DESCRIPTION: Renders a white line between points (56, 143) and (168, 208).
; PLAN: r0=56(x1), r1=143(y1), r2=168(x2), r3=208(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 143
LDI r2, 168
LDI r3, 208
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
