; DESCRIPTION: Places a cyan line segment connecting (434, 196) to (16, 222).
; PLAN: r0=434(x1), r1=196(y1), r2=16(x2), r3=222(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 196
LDI r2, 16
LDI r3, 222
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
