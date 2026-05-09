; DESCRIPTION: Draws a cyan line from (215, 255) to (483, 250).
; PLAN: r0=215(x1), r1=255(y1), r2=483(x2), r3=250(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 255
LDI r2, 483
LDI r3, 250
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
