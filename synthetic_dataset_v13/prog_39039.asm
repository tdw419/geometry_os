; DESCRIPTION: Draws a cyan line from (179, 149) to (480, 87).
; PLAN: r0=179(x1), r1=149(y1), r2=480(x2), r3=87(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 149
LDI r2, 480
LDI r3, 87
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
