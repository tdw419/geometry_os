; DESCRIPTION: Places a cyan line segment connecting (213, 61) to (23, 7).
; PLAN: r0=213(x1), r1=61(y1), r2=23(x2), r3=7(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 61
LDI r2, 23
LDI r3, 7
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
