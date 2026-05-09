; DESCRIPTION: Renders a cyan line between points (257, 177) and (352, 138).
; PLAN: r0=257(x1), r1=177(y1), r2=352(x2), r3=138(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 177
LDI r2, 352
LDI r3, 138
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
