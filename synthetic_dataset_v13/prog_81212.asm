; DESCRIPTION: Places a green line segment connecting (415, 116) to (415, 210).
; PLAN: r0=415(x1), r1=116(y1), r2=415(x2), r3=210(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 415
LDI r1, 116
LDI r2, 415
LDI r3, 210
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
