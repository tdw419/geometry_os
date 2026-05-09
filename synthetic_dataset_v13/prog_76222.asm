; DESCRIPTION: Draws a cyan line from (406, 226) to (397, 72).
; PLAN: r0=406(x1), r1=226(y1), r2=397(x2), r3=72(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 226
LDI r2, 397
LDI r3, 72
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
