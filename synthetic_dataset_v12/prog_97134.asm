; DESCRIPTION: Places a cyan line segment connecting (288, 168) to (434, 181).
; PLAN: r0=288(x1), r1=168(y1), r2=434(x2), r3=181(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 168
LDI r2, 434
LDI r3, 181
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
