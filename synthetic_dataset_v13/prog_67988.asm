; DESCRIPTION: Places a cyan line segment connecting (339, 243) to (108, 210).
; PLAN: r0=339(x1), r1=243(y1), r2=108(x2), r3=210(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 243
LDI r2, 108
LDI r3, 210
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
