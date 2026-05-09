; DESCRIPTION: Renders a cyan line between points (3, 247) and (263, 139).
; PLAN: r0=3(x1), r1=247(y1), r2=263(x2), r3=139(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 247
LDI r2, 263
LDI r3, 139
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
