; DESCRIPTION: Places a cyan line segment connecting (293, 152) to (487, 34).
; PLAN: r0=293(x1), r1=152(y1), r2=487(x2), r3=34(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 152
LDI r2, 487
LDI r3, 34
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
