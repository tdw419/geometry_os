; DESCRIPTION: Places a white line segment connecting (480, 151) to (127, 84).
; PLAN: r0=480(x1), r1=151(y1), r2=127(x2), r3=84(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 151
LDI r2, 127
LDI r3, 84
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
