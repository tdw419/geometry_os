; DESCRIPTION: Draws a cyan line from (326, 241) to (113, 3).
; PLAN: r0=326(x1), r1=241(y1), r2=113(x2), r3=3(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 241
LDI r2, 113
LDI r3, 3
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
