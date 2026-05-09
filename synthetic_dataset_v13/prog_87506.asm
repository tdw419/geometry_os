; DESCRIPTION: Draws a cyan line from (256, 3) to (356, 184).
; PLAN: r0=256(x1), r1=3(y1), r2=356(x2), r3=184(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 3
LDI r2, 356
LDI r3, 184
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
