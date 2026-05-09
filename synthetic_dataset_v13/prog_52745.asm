; DESCRIPTION: Draws a cyan line from (147, 8) to (384, 209).
; PLAN: r0=147(x1), r1=8(y1), r2=384(x2), r3=209(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 8
LDI r2, 384
LDI r3, 209
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
