; DESCRIPTION: Renders a white line between points (210, 249) and (57, 128).
; PLAN: r0=210(x1), r1=249(y1), r2=57(x2), r3=128(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 249
LDI r2, 57
LDI r3, 128
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
