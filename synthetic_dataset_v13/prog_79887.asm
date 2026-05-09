; DESCRIPTION: Places a red line segment connecting (245, 127) to (294, 231).
; PLAN: r0=245(x1), r1=127(y1), r2=294(x2), r3=231(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 127
LDI r2, 294
LDI r3, 231
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
