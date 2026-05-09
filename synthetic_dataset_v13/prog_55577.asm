; DESCRIPTION: Places a cyan line segment connecting (81, 177) to (218, 55).
; PLAN: r0=81(x1), r1=177(y1), r2=218(x2), r3=55(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 177
LDI r2, 218
LDI r3, 55
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
