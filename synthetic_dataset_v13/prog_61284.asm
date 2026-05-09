; DESCRIPTION: Places a cyan line segment connecting (434, 128) to (195, 140).
; PLAN: r0=434(x1), r1=128(y1), r2=195(x2), r3=140(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 128
LDI r2, 195
LDI r3, 140
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
