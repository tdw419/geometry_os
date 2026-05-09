; DESCRIPTION: Draws a black line from (329, 58) to (263, 228).
; PLAN: r0=329(x1), r1=58(y1), r2=263(x2), r3=228(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 58
LDI r2, 263
LDI r3, 228
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
