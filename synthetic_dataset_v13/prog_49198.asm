; DESCRIPTION: Renders a cyan line between points (288, 232) and (257, 243).
; PLAN: r0=288(x1), r1=232(y1), r2=257(x2), r3=243(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 232
LDI r2, 257
LDI r3, 243
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
