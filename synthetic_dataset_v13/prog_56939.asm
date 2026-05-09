; DESCRIPTION: Places a cyan line segment connecting (108, 144) to (242, 202).
; PLAN: r0=108(x1), r1=144(y1), r2=242(x2), r3=202(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 144
LDI r2, 242
LDI r3, 202
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
