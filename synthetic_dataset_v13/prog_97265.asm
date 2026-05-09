; DESCRIPTION: Renders a cyan line between points (49, 205) and (90, 50).
; PLAN: r0=49(x1), r1=205(y1), r2=90(x2), r3=50(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 205
LDI r2, 90
LDI r3, 50
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
