; DESCRIPTION: Draws a cyan line from (483, 102) to (173, 113).
; PLAN: r0=483(x1), r1=102(y1), r2=173(x2), r3=113(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 483
LDI r1, 102
LDI r2, 173
LDI r3, 113
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
