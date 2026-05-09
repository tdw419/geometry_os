; DESCRIPTION: Draws a black line from (32, 86) to (294, 33).
; PLAN: r0=32(x1), r1=86(y1), r2=294(x2), r3=33(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 86
LDI r2, 294
LDI r3, 33
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
