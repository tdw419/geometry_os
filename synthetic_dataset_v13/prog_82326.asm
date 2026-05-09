; DESCRIPTION: Places a cyan line segment connecting (480, 64) to (277, 121).
; PLAN: r0=480(x1), r1=64(y1), r2=277(x2), r3=121(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 64
LDI r2, 277
LDI r3, 121
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
