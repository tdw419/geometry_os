; DESCRIPTION: Places a cyan line segment connecting (418, 173) to (384, 93).
; PLAN: r0=418(x1), r1=173(y1), r2=384(x2), r3=93(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 173
LDI r2, 384
LDI r3, 93
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
