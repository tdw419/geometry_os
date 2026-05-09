; DESCRIPTION: Places a cyan line segment connecting (330, 146) to (450, 58).
; PLAN: r0=330(x1), r1=146(y1), r2=450(x2), r3=58(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 146
LDI r2, 450
LDI r3, 58
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
