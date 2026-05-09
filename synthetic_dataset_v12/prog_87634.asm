; DESCRIPTION: Places a cyan line segment connecting (480, 99) to (27, 115).
; PLAN: r0=480(x1), r1=99(y1), r2=27(x2), r3=115(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 99
LDI r2, 27
LDI r3, 115
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
