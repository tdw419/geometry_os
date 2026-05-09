; DESCRIPTION: Draws a cyan line from (384, 111) to (137, 244).
; PLAN: r0=384(x1), r1=111(y1), r2=137(x2), r3=244(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 111
LDI r2, 137
LDI r3, 244
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
