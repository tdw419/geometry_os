; DESCRIPTION: Draws a green line from (333, 150) to (280, 242).
; PLAN: r0=333(x1), r1=150(y1), r2=280(x2), r3=242(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 150
LDI r2, 280
LDI r3, 242
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
