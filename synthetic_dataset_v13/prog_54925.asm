; DESCRIPTION: Places a cyan line segment connecting (213, 124) to (256, 233).
; PLAN: r0=213(x1), r1=124(y1), r2=256(x2), r3=233(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 124
LDI r2, 256
LDI r3, 233
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
