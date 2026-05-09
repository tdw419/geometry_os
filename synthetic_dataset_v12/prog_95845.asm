; DESCRIPTION: Draws a cyan line from (418, 96) to (397, 48).
; PLAN: r0=418(x1), r1=96(y1), r2=397(x2), r3=48(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 96
LDI r2, 397
LDI r3, 48
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
