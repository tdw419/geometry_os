; DESCRIPTION: Places a yellow line segment connecting (168, 180) to (242, 223).
; PLAN: r0=168(x1), r1=180(y1), r2=242(x2), r3=223(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 180
LDI r2, 242
LDI r3, 223
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
