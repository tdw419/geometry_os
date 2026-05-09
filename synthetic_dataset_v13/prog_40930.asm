; DESCRIPTION: Draws a cyan line from (435, 240) to (257, 131).
; PLAN: r0=435(x1), r1=240(y1), r2=257(x2), r3=131(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 240
LDI r2, 257
LDI r3, 131
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
