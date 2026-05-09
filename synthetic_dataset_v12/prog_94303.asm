; DESCRIPTION: Places a cyan line segment connecting (365, 32) to (92, 84).
; PLAN: r0=365(x1), r1=32(y1), r2=92(x2), r3=84(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 32
LDI r2, 92
LDI r3, 84
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
