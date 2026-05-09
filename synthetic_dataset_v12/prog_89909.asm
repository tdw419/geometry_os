; DESCRIPTION: Places a cyan line segment connecting (330, 193) to (103, 240).
; PLAN: r0=330(x1), r1=193(y1), r2=103(x2), r3=240(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 193
LDI r2, 103
LDI r3, 240
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
