; DESCRIPTION: Places a cyan line segment connecting (307, 59) to (85, 242).
; PLAN: r0=307(x1), r1=59(y1), r2=85(x2), r3=242(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 59
LDI r2, 85
LDI r3, 242
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
