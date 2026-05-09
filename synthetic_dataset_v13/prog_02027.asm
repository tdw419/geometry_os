; DESCRIPTION: Draws a cyan line from (295, 88) to (257, 93).
; PLAN: r0=295(x1), r1=88(y1), r2=257(x2), r3=93(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 88
LDI r2, 257
LDI r3, 93
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
