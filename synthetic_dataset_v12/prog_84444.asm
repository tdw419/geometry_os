; DESCRIPTION: Draws a cyan line from (178, 14) to (397, 73).
; PLAN: r0=178(x1), r1=14(y1), r2=397(x2), r3=73(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 14
LDI r2, 397
LDI r3, 73
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
