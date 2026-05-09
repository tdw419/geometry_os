; DESCRIPTION: Renders a green line between points (275, 107) and (403, 184).
; PLAN: r0=275(x1), r1=107(y1), r2=403(x2), r3=184(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 107
LDI r2, 403
LDI r3, 184
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
