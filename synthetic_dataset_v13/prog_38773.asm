; DESCRIPTION: Draws a cyan line from (480, 172) to (37, 108).
; PLAN: r0=480(x1), r1=172(y1), r2=37(x2), r3=108(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 172
LDI r2, 37
LDI r3, 108
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
