; DESCRIPTION: Draws a cyan line from (29, 36) to (511, 195).
; PLAN: r0=29(x1), r1=36(y1), r2=511(x2), r3=195(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 36
LDI r2, 511
LDI r3, 195
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
