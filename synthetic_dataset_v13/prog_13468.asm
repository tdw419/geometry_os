; DESCRIPTION: Places a cyan line segment connecting (492, 141) to (394, 91).
; PLAN: r0=492(x1), r1=141(y1), r2=394(x2), r3=91(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 141
LDI r2, 394
LDI r3, 91
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
