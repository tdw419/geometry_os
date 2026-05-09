; DESCRIPTION: Places a cyan line segment connecting (294, 124) to (280, 149).
; PLAN: r0=294(x1), r1=124(y1), r2=280(x2), r3=149(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 124
LDI r2, 280
LDI r3, 149
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
