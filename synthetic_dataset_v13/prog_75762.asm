; DESCRIPTION: Places a cyan line segment connecting (386, 173) to (304, 80).
; PLAN: r0=386(x1), r1=173(y1), r2=304(x2), r3=80(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 173
LDI r2, 304
LDI r3, 80
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
