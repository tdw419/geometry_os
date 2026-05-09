; DESCRIPTION: Renders a cyan line between points (32, 37) and (257, 225).
; PLAN: r0=32(x1), r1=37(y1), r2=257(x2), r3=225(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 37
LDI r2, 257
LDI r3, 225
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
