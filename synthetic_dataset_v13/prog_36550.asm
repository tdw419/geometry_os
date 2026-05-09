; DESCRIPTION: Places a cyan line segment connecting (208, 107) to (153, 146).
; PLAN: r0=208(x1), r1=107(y1), r2=153(x2), r3=146(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 107
LDI r2, 153
LDI r3, 146
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
