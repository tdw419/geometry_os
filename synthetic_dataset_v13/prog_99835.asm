; DESCRIPTION: Places a cyan line segment connecting (57, 36) to (294, 164).
; PLAN: r0=57(x1), r1=36(y1), r2=294(x2), r3=164(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 36
LDI r2, 294
LDI r3, 164
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
