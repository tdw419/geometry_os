; DESCRIPTION: Places a cyan line segment connecting (187, 146) to (176, 137).
; PLAN: r0=187(x1), r1=146(y1), r2=176(x2), r3=137(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 146
LDI r2, 176
LDI r3, 137
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
