; DESCRIPTION: Places a green line segment connecting (237, 42) to (218, 242).
; PLAN: r0=237(x1), r1=42(y1), r2=218(x2), r3=242(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 42
LDI r2, 218
LDI r3, 242
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
