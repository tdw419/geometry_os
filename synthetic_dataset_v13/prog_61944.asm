; DESCRIPTION: Places a cyan line segment connecting (492, 128) to (290, 128).
; PLAN: r0=492(x1), r1=128(y1), r2=290(x2), r3=128(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 128
LDI r2, 290
LDI r3, 128
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
