; DESCRIPTION: Places a cyan line segment connecting (30, 48) to (470, 224).
; PLAN: r0=30(x1), r1=48(y1), r2=470(x2), r3=224(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 48
LDI r2, 470
LDI r3, 224
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
