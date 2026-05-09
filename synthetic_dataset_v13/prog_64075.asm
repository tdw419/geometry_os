; DESCRIPTION: Draws a cyan line from (264, 70) to (345, 164).
; PLAN: r0=264(x1), r1=70(y1), r2=345(x2), r3=164(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 70
LDI r2, 345
LDI r3, 164
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
