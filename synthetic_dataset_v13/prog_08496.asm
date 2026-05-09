; DESCRIPTION: Draws a yellow line from (239, 191) to (242, 52).
; PLAN: r0=239(x1), r1=191(y1), r2=242(x2), r3=52(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 191
LDI r2, 242
LDI r3, 52
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
