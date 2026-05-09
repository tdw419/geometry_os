; DESCRIPTION: Draws a green line from (263, 48) to (308, 172).
; PLAN: r0=263(x1), r1=48(y1), r2=308(x2), r3=172(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 48
LDI r2, 308
LDI r3, 172
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
