; DESCRIPTION: Places a cyan line segment connecting (275, 204) to (279, 120).
; PLAN: r0=275(x1), r1=204(y1), r2=279(x2), r3=120(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 204
LDI r2, 279
LDI r3, 120
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
