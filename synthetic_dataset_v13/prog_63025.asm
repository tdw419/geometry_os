; DESCRIPTION: Draws a cyan line from (254, 32) to (226, 70).
; PLAN: r0=254(x1), r1=32(y1), r2=226(x2), r3=70(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 32
LDI r2, 226
LDI r3, 70
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
