; DESCRIPTION: Places a cyan line segment connecting (173, 1) to (134, 111).
; PLAN: r0=173(x1), r1=1(y1), r2=134(x2), r3=111(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 1
LDI r2, 134
LDI r3, 111
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
