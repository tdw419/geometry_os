; DESCRIPTION: Places a cyan line segment connecting (487, 64) to (435, 19).
; PLAN: r0=487(x1), r1=64(y1), r2=435(x2), r3=19(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 64
LDI r2, 435
LDI r3, 19
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
