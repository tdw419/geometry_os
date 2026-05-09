; DESCRIPTION: Places a green line segment connecting (298, 108) to (271, 126).
; PLAN: r0=298(x1), r1=108(y1), r2=271(x2), r3=126(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 108
LDI r2, 271
LDI r3, 126
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
