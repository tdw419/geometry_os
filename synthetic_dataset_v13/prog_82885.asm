; DESCRIPTION: Draws a cyan line from (96, 240) to (356, 219).
; PLAN: r0=96(x1), r1=240(y1), r2=356(x2), r3=219(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 240
LDI r2, 356
LDI r3, 219
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
