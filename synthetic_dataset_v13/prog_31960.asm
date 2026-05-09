; DESCRIPTION: Renders a cyan line between points (403, 249) and (326, 194).
; PLAN: r0=403(x1), r1=249(y1), r2=326(x2), r3=194(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 249
LDI r2, 326
LDI r3, 194
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
