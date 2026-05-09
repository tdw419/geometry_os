; DESCRIPTION: Places a cyan line segment connecting (294, 185) to (398, 215).
; PLAN: r0=294(x1), r1=185(y1), r2=398(x2), r3=215(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 185
LDI r2, 398
LDI r3, 215
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
