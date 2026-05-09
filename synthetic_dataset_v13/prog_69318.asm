; DESCRIPTION: Draws a cyan line from (236, 238) to (96, 56).
; PLAN: r0=236(x1), r1=238(y1), r2=96(x2), r3=56(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 238
LDI r2, 96
LDI r3, 56
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
