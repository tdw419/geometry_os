; DESCRIPTION: Places a blue line segment connecting (492, 27) to (460, 113).
; PLAN: r0=492(x1), r1=27(y1), r2=460(x2), r3=113(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 27
LDI r2, 460
LDI r3, 113
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
