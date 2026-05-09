; DESCRIPTION: Renders a cyan line between points (445, 100) and (256, 87).
; PLAN: r0=445(x1), r1=100(y1), r2=256(x2), r3=87(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 100
LDI r2, 256
LDI r3, 87
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
