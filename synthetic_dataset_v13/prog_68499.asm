; DESCRIPTION: Places a cyan line segment connecting (398, 253) to (372, 12).
; PLAN: r0=398(x1), r1=253(y1), r2=372(x2), r3=12(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 253
LDI r2, 372
LDI r3, 12
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
