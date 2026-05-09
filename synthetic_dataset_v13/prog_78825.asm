; DESCRIPTION: Draws a cyan line from (445, 131) to (257, 21).
; PLAN: r0=445(x1), r1=131(y1), r2=257(x2), r3=21(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 131
LDI r2, 257
LDI r3, 21
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
