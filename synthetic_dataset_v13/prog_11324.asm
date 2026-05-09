; DESCRIPTION: Draws a cyan line from (121, 32) to (332, 180).
; PLAN: r0=121(x1), r1=32(y1), r2=332(x2), r3=180(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 32
LDI r2, 332
LDI r3, 180
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
