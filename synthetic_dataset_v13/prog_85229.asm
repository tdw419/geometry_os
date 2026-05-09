; DESCRIPTION: Draws a green line from (418, 14) to (239, 146).
; PLAN: r0=418(x1), r1=14(y1), r2=239(x2), r3=146(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 14
LDI r2, 239
LDI r3, 146
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
