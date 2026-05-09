; DESCRIPTION: Places a cyan line segment connecting (209, 242) to (467, 71).
; PLAN: r0=209(x1), r1=242(y1), r2=467(x2), r3=71(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 242
LDI r2, 467
LDI r3, 71
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
