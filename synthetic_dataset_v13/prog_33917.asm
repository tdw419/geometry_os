; DESCRIPTION: Places a cyan line segment connecting (469, 213) to (98, 193).
; PLAN: r0=469(x1), r1=213(y1), r2=98(x2), r3=193(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 469
LDI r1, 213
LDI r2, 98
LDI r3, 193
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
