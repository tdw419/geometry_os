; DESCRIPTION: Places a cyan line segment connecting (113, 205) to (275, 30).
; PLAN: r0=113(x1), r1=205(y1), r2=275(x2), r3=30(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 205
LDI r2, 275
LDI r3, 30
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
