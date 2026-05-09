; DESCRIPTION: Places a black line segment connecting (446, 207) to (45, 113).
; PLAN: r0=446(x1), r1=207(y1), r2=45(x2), r3=113(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 207
LDI r2, 45
LDI r3, 113
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
