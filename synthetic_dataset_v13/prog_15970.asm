; DESCRIPTION: Draws a green line from (31, 184) to (284, 215).
; PLAN: r0=31(x1), r1=184(y1), r2=284(x2), r3=215(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 184
LDI r2, 284
LDI r3, 215
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
