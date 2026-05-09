; DESCRIPTION: Draws a cyan line from (434, 53) to (20, 219).
; PLAN: r0=434(x1), r1=53(y1), r2=20(x2), r3=219(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 53
LDI r2, 20
LDI r3, 219
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
