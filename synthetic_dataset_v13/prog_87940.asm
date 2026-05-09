; DESCRIPTION: Draws a cyan line from (64, 183) to (263, 137).
; PLAN: r0=64(x1), r1=183(y1), r2=263(x2), r3=137(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 183
LDI r2, 263
LDI r3, 137
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
