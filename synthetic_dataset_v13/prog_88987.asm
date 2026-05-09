; DESCRIPTION: Renders a cyan line between points (362, 237) and (496, 128).
; PLAN: r0=362(x1), r1=237(y1), r2=496(x2), r3=128(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 237
LDI r2, 496
LDI r3, 128
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
