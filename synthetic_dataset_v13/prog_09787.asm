; DESCRIPTION: Draws a cyan line from (320, 149) to (125, 23).
; PLAN: r0=320(x1), r1=149(y1), r2=125(x2), r3=23(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 149
LDI r2, 125
LDI r3, 23
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
