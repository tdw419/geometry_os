; DESCRIPTION: Draws a green line from (332, 228) to (464, 249).
; PLAN: r0=332(x1), r1=228(y1), r2=464(x2), r3=249(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 228
LDI r2, 464
LDI r3, 249
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
