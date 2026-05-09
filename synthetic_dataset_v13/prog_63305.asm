; DESCRIPTION: Places a yellow line segment connecting (497, 249) to (320, 213).
; PLAN: r0=497(x1), r1=249(y1), r2=320(x2), r3=213(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 497
LDI r1, 249
LDI r2, 320
LDI r3, 213
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
