; DESCRIPTION: Draws a green line from (6, 146) to (284, 249).
; PLAN: r0=6(x1), r1=146(y1), r2=284(x2), r3=249(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 146
LDI r2, 284
LDI r3, 249
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
