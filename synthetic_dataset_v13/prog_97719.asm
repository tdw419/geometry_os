; DESCRIPTION: Draws a cyan line from (396, 28) to (503, 231).
; PLAN: r0=396(x1), r1=28(y1), r2=503(x2), r3=231(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 28
LDI r2, 503
LDI r3, 231
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
