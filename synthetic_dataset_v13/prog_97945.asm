; DESCRIPTION: Places a cyan line segment connecting (195, 228) to (445, 31).
; PLAN: r0=195(x1), r1=228(y1), r2=445(x2), r3=31(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 228
LDI r2, 445
LDI r3, 31
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
