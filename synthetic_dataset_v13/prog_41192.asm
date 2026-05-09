; DESCRIPTION: Draws a cyan line from (511, 76) to (90, 215).
; PLAN: r0=511(x1), r1=76(y1), r2=90(x2), r3=215(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 511
LDI r1, 76
LDI r2, 90
LDI r3, 215
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
