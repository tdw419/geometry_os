; DESCRIPTION: Draws a black line from (66, 16) to (284, 192).
; PLAN: r0=66(x1), r1=16(y1), r2=284(x2), r3=192(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 16
LDI r2, 284
LDI r3, 192
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
