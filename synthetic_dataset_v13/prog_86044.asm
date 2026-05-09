; DESCRIPTION: Renders a green line between points (48, 72) and (403, 128).
; PLAN: r0=48(x1), r1=72(y1), r2=403(x2), r3=128(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 72
LDI r2, 403
LDI r3, 128
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
