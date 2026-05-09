; DESCRIPTION: Renders a cyan line between points (495, 90) and (372, 128).
; PLAN: r0=495(x1), r1=90(y1), r2=372(x2), r3=128(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 495
LDI r1, 90
LDI r2, 372
LDI r3, 128
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
