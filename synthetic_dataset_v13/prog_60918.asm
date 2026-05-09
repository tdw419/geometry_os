; DESCRIPTION: Places a cyan line segment connecting (464, 94) to (386, 237).
; PLAN: r0=464(x1), r1=94(y1), r2=386(x2), r3=237(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 94
LDI r2, 386
LDI r3, 237
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
