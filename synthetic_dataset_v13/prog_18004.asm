; DESCRIPTION: Draws a black line from (154, 187) to (239, 220).
; PLAN: r0=154(x1), r1=187(y1), r2=239(x2), r3=220(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 187
LDI r2, 239
LDI r3, 220
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
