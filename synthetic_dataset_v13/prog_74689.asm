; DESCRIPTION: Draws a white line from (479, 64) to (439, 69).
; PLAN: r0=479(x1), r1=64(y1), r2=439(x2), r3=69(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 64
LDI r2, 439
LDI r3, 69
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
