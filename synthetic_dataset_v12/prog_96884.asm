; DESCRIPTION: Places a red line segment connecting (169, 64) to (242, 228).
; PLAN: r0=169(x1), r1=64(y1), r2=242(x2), r3=228(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 64
LDI r2, 242
LDI r3, 228
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
