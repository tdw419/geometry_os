; DESCRIPTION: Draws a cyan line from (336, 21) to (105, 113).
; PLAN: r0=336(x1), r1=21(y1), r2=105(x2), r3=113(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 21
LDI r2, 105
LDI r3, 113
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
