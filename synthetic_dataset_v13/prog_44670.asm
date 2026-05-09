; DESCRIPTION: Places a cyan line segment connecting (140, 16) to (182, 146).
; PLAN: r0=140(x1), r1=16(y1), r2=182(x2), r3=146(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 16
LDI r2, 182
LDI r3, 146
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
