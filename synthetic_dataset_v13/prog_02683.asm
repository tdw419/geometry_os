; DESCRIPTION: Draws a cyan line from (463, 40) to (215, 202).
; PLAN: r0=463(x1), r1=40(y1), r2=215(x2), r3=202(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 40
LDI r2, 215
LDI r3, 202
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
