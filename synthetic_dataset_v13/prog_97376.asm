; DESCRIPTION: Renders a cyan line between points (50, 211) and (16, 38).
; PLAN: r0=50(x1), r1=211(y1), r2=16(x2), r3=38(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 211
LDI r2, 16
LDI r3, 38
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
