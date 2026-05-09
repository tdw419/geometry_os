; DESCRIPTION: Draws a cyan line from (176, 40) to (331, 64).
; PLAN: r0=176(x1), r1=40(y1), r2=331(x2), r3=64(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 40
LDI r2, 331
LDI r3, 64
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
