; DESCRIPTION: Places a green line segment connecting (180, 127) to (305, 242).
; PLAN: r0=180(x1), r1=127(y1), r2=305(x2), r3=242(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 127
LDI r2, 305
LDI r3, 242
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
