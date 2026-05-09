; DESCRIPTION: Places a white line segment connecting (65, 44) to (320, 177).
; PLAN: r0=65(x1), r1=44(y1), r2=320(x2), r3=177(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 44
LDI r2, 320
LDI r3, 177
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
