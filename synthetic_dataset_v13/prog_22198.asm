; DESCRIPTION: Draws a green line from (343, 108) to (333, 242).
; PLAN: r0=343(x1), r1=108(y1), r2=333(x2), r3=242(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 108
LDI r2, 333
LDI r3, 242
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
