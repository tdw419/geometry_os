; DESCRIPTION: Draws a white line from (479, 53) to (230, 61).
; PLAN: r0=479(x1), r1=53(y1), r2=230(x2), r3=61(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 53
LDI r2, 230
LDI r3, 61
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
