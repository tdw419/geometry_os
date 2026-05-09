; DESCRIPTION: Places a cyan line segment connecting (243, 187) to (215, 130).
; PLAN: r0=243(x1), r1=187(y1), r2=215(x2), r3=130(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 187
LDI r2, 215
LDI r3, 130
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
