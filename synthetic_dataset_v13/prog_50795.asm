; DESCRIPTION: Places a cyan line segment connecting (289, 64) to (33, 171).
; PLAN: r0=289(x1), r1=64(y1), r2=33(x2), r3=171(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 64
LDI r2, 33
LDI r3, 171
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
