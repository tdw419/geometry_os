; DESCRIPTION: Places a cyan line segment connecting (161, 143) to (228, 12).
; PLAN: r0=161(x1), r1=143(y1), r2=228(x2), r3=12(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 143
LDI r2, 228
LDI r3, 12
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
