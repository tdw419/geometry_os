; DESCRIPTION: Renders a cyan line between points (60, 245) and (445, 90).
; PLAN: r0=60(x1), r1=245(y1), r2=445(x2), r3=90(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 245
LDI r2, 445
LDI r3, 90
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
