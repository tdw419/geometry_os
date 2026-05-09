; DESCRIPTION: Renders a cyan line between points (49, 22) and (103, 164).
; PLAN: r0=49(x1), r1=22(y1), r2=103(x2), r3=164(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 22
LDI r2, 103
LDI r3, 164
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
