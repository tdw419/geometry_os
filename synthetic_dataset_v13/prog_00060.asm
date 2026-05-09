; DESCRIPTION: Renders a cyan line between points (406, 210) and (307, 88).
; PLAN: r0=406(x1), r1=210(y1), r2=307(x2), r3=88(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 210
LDI r2, 307
LDI r3, 88
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
