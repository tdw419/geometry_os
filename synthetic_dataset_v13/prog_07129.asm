; DESCRIPTION: Places a cyan line segment connecting (300, 35) to (353, 29).
; PLAN: r0=300(x1), r1=35(y1), r2=353(x2), r3=29(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 35
LDI r2, 353
LDI r3, 29
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
