; DESCRIPTION: Places a cyan line segment connecting (502, 35) to (238, 5).
; PLAN: r0=502(x1), r1=35(y1), r2=238(x2), r3=5(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 502
LDI r1, 35
LDI r2, 238
LDI r3, 5
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
