; DESCRIPTION: Renders a cyan line between points (194, 226) and (474, 242).
; PLAN: r0=194(x1), r1=226(y1), r2=474(x2), r3=242(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 226
LDI r2, 474
LDI r3, 242
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
