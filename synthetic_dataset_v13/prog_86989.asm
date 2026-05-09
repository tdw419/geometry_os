; DESCRIPTION: Places a cyan line segment connecting (332, 14) to (410, 242).
; PLAN: r0=332(x1), r1=14(y1), r2=410(x2), r3=242(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 14
LDI r2, 410
LDI r3, 242
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
