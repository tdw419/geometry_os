; DESCRIPTION: Places a green line segment connecting (255, 70) to (460, 143).
; PLAN: r0=255(x1), r1=70(y1), r2=460(x2), r3=143(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 70
LDI r2, 460
LDI r3, 143
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
