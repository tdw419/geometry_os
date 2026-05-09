; DESCRIPTION: Places a white line segment connecting (487, 246) to (264, 125).
; PLAN: r0=487(x1), r1=246(y1), r2=264(x2), r3=125(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 246
LDI r2, 264
LDI r3, 125
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
