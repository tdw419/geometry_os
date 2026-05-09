; DESCRIPTION: Places a cyan line segment connecting (349, 114) to (173, 237).
; PLAN: r0=349(x1), r1=114(y1), r2=173(x2), r3=237(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 114
LDI r2, 173
LDI r3, 237
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
