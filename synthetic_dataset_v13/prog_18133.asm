; DESCRIPTION: Places a cyan line segment connecting (257, 21) to (362, 125).
; PLAN: r0=257(x1), r1=21(y1), r2=362(x2), r3=125(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 21
LDI r2, 362
LDI r3, 125
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
