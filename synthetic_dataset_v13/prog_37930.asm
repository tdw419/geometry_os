; DESCRIPTION: Places a cyan line segment connecting (502, 128) to (334, 193).
; PLAN: r0=502(x1), r1=128(y1), r2=334(x2), r3=193(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 502
LDI r1, 128
LDI r2, 334
LDI r3, 193
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
