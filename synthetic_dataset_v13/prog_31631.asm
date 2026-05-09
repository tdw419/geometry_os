; DESCRIPTION: Renders a cyan line between points (403, 205) and (405, 115).
; PLAN: r0=403(x1), r1=205(y1), r2=405(x2), r3=115(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 205
LDI r2, 405
LDI r3, 115
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
