; DESCRIPTION: Places a cyan line segment connecting (302, 48) to (112, 242).
; PLAN: r0=302(x1), r1=48(y1), r2=112(x2), r3=242(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 48
LDI r2, 112
LDI r3, 242
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
