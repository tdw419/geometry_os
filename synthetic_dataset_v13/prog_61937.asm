; DESCRIPTION: Places a black line segment connecting (294, 219) to (410, 125).
; PLAN: r0=294(x1), r1=219(y1), r2=410(x2), r3=125(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 219
LDI r2, 410
LDI r3, 125
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
