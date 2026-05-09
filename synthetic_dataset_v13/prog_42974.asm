; DESCRIPTION: Places a cyan line segment connecting (19, 146) to (385, 103).
; PLAN: r0=19(x1), r1=146(y1), r2=385(x2), r3=103(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 146
LDI r2, 385
LDI r3, 103
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
