; DESCRIPTION: Renders a white line between points (479, 58) and (181, 40).
; PLAN: r0=479(x1), r1=58(y1), r2=181(x2), r3=40(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 58
LDI r2, 181
LDI r3, 40
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
