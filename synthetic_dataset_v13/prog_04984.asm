; DESCRIPTION: Draws a cyan line from (449, 32) to (138, 72).
; PLAN: r0=449(x1), r1=32(y1), r2=138(x2), r3=72(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 32
LDI r2, 138
LDI r3, 72
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
