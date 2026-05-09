; DESCRIPTION: Draws a cyan line from (32, 143) to (288, 10).
; PLAN: r0=32(x1), r1=143(y1), r2=288(x2), r3=10(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 143
LDI r2, 288
LDI r3, 10
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
