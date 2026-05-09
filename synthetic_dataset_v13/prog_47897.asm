; DESCRIPTION: Places a cyan line segment connecting (262, 86) to (249, 210).
; PLAN: r0=262(x1), r1=86(y1), r2=249(x2), r3=210(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 86
LDI r2, 249
LDI r3, 210
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
