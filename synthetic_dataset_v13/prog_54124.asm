; DESCRIPTION: Draws a green line from (386, 154) to (336, 108).
; PLAN: r0=386(x1), r1=154(y1), r2=336(x2), r3=108(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 154
LDI r2, 336
LDI r3, 108
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
