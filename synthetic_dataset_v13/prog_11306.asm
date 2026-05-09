; DESCRIPTION: Draws a cyan line from (329, 53) to (142, 184).
; PLAN: r0=329(x1), r1=53(y1), r2=142(x2), r3=184(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 53
LDI r2, 142
LDI r3, 184
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
