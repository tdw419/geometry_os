; DESCRIPTION: Draws a green line from (346, 128) to (413, 220).
; PLAN: r0=346(x1), r1=128(y1), r2=413(x2), r3=220(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 128
LDI r2, 413
LDI r3, 220
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
