; DESCRIPTION: Draws a green line from (479, 255) to (497, 76).
; PLAN: r0=479(x1), r1=255(y1), r2=497(x2), r3=76(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 255
LDI r2, 497
LDI r3, 76
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
