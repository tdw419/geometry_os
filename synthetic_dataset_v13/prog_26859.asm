; DESCRIPTION: Draws a green line from (257, 108) to (403, 37).
; PLAN: r0=257(x1), r1=108(y1), r2=403(x2), r3=37(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 108
LDI r2, 403
LDI r3, 37
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
