; DESCRIPTION: Places a cyan line segment connecting (446, 94) to (46, 19).
; PLAN: r0=446(x1), r1=94(y1), r2=46(x2), r3=19(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 94
LDI r2, 46
LDI r3, 19
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
