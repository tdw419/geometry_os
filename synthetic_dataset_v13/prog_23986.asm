; DESCRIPTION: Places a cyan line segment connecting (24, 37) to (228, 159).
; PLAN: r0=24(x1), r1=37(y1), r2=228(x2), r3=159(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 37
LDI r2, 228
LDI r3, 159
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
