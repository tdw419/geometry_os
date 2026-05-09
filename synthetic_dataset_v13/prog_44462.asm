; DESCRIPTION: Renders a white line between points (397, 94) and (479, 71).
; PLAN: r0=397(x1), r1=94(y1), r2=479(x2), r3=71(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 94
LDI r2, 479
LDI r3, 71
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
