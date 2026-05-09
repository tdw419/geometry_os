; DESCRIPTION: Renders a green line between points (365, 221) and (94, 56).
; PLAN: r0=365(x1), r1=221(y1), r2=94(x2), r3=56(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 221
LDI r2, 94
LDI r3, 56
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
