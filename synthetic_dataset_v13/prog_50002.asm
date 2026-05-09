; DESCRIPTION: Places a cyan line segment connecting (156, 215) to (124, 134).
; PLAN: r0=156(x1), r1=215(y1), r2=124(x2), r3=134(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 215
LDI r2, 124
LDI r3, 134
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
