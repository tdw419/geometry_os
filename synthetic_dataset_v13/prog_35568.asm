; DESCRIPTION: Places a cyan line segment connecting (171, 103) to (453, 238).
; PLAN: r0=171(x1), r1=103(y1), r2=453(x2), r3=238(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 103
LDI r2, 453
LDI r3, 238
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
