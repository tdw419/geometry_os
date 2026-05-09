; DESCRIPTION: Draws a black line from (491, 129) to (310, 86).
; PLAN: r0=491(x1), r1=129(y1), r2=310(x2), r3=86(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 129
LDI r2, 310
LDI r3, 86
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
