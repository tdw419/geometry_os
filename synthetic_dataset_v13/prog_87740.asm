; DESCRIPTION: Places a blue line segment connecting (465, 56) to (340, 213).
; PLAN: r0=465(x1), r1=56(y1), r2=340(x2), r3=213(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 56
LDI r2, 340
LDI r3, 213
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
