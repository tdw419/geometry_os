; DESCRIPTION: Places a cyan line segment connecting (234, 171) to (456, 186).
; PLAN: r0=234(x1), r1=171(y1), r2=456(x2), r3=186(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 171
LDI r2, 456
LDI r3, 186
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
