; DESCRIPTION: Renders a cyan line between points (509, 152) and (163, 202).
; PLAN: r0=509(x1), r1=152(y1), r2=163(x2), r3=202(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 509
LDI r1, 152
LDI r2, 163
LDI r3, 202
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
