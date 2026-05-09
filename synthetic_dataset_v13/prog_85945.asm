; DESCRIPTION: Places a cyan line segment connecting (450, 161) to (420, 220).
; PLAN: r0=450(x1), r1=161(y1), r2=420(x2), r3=220(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 161
LDI r2, 420
LDI r3, 220
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
