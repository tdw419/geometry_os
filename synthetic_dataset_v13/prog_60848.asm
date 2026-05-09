; DESCRIPTION: Renders a cyan line between points (445, 50) and (46, 21).
; PLAN: r0=445(x1), r1=50(y1), r2=46(x2), r3=21(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 50
LDI r2, 46
LDI r3, 21
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
