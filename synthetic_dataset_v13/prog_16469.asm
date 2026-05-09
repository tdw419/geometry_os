; DESCRIPTION: Renders a green line between points (443, 122) and (239, 38).
; PLAN: r0=443(x1), r1=122(y1), r2=239(x2), r3=38(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 122
LDI r2, 239
LDI r3, 38
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
