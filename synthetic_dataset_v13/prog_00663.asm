; DESCRIPTION: Places a cyan line segment connecting (150, 243) to (469, 128).
; PLAN: r0=150(x1), r1=243(y1), r2=469(x2), r3=128(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 243
LDI r2, 469
LDI r3, 128
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
