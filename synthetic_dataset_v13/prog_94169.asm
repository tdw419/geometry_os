; DESCRIPTION: Renders a cyan line between points (403, 140) and (206, 62).
; PLAN: r0=403(x1), r1=140(y1), r2=206(x2), r3=62(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 140
LDI r2, 206
LDI r3, 62
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
