; DESCRIPTION: Draws a cyan line from (52, 143) to (356, 15).
; PLAN: r0=52(x1), r1=143(y1), r2=356(x2), r3=15(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 143
LDI r2, 356
LDI r3, 15
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
