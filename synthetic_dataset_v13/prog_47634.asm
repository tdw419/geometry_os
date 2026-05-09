; DESCRIPTION: Renders a cyan line between points (473, 62) and (405, 194).
; PLAN: r0=473(x1), r1=62(y1), r2=405(x2), r3=194(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 473
LDI r1, 62
LDI r2, 405
LDI r3, 194
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
