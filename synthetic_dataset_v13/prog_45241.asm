; DESCRIPTION: Draws a green line from (244, 233) to (384, 242).
; PLAN: r0=244(x1), r1=233(y1), r2=384(x2), r3=242(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 233
LDI r2, 384
LDI r3, 242
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
