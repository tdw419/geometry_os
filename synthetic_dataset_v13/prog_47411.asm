; DESCRIPTION: Places a cyan line segment connecting (421, 73) to (503, 195).
; PLAN: r0=421(x1), r1=73(y1), r2=503(x2), r3=195(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 73
LDI r2, 503
LDI r3, 195
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
