; DESCRIPTION: Places a cyan line segment connecting (153, 61) to (488, 204).
; PLAN: r0=153(x1), r1=61(y1), r2=488(x2), r3=204(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 61
LDI r2, 488
LDI r3, 204
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
