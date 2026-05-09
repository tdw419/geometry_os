; DESCRIPTION: Places a cyan line segment connecting (437, 176) to (173, 57).
; PLAN: r0=437(x1), r1=176(y1), r2=173(x2), r3=57(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 176
LDI r2, 173
LDI r3, 57
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
