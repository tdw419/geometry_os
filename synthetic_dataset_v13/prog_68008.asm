; DESCRIPTION: Places a black line segment connecting (333, 226) to (443, 174).
; PLAN: r0=333(x1), r1=226(y1), r2=443(x2), r3=174(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 226
LDI r2, 443
LDI r3, 174
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
