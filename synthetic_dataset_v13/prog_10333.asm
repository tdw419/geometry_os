; DESCRIPTION: Renders a white line between points (462, 72) and (479, 108).
; PLAN: r0=462(x1), r1=72(y1), r2=479(x2), r3=108(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 72
LDI r2, 479
LDI r3, 108
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
