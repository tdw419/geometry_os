; DESCRIPTION: Places a cyan line segment connecting (48, 12) to (125, 214).
; PLAN: r0=48(x1), r1=12(y1), r2=125(x2), r3=214(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 12
LDI r2, 125
LDI r3, 214
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
