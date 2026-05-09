; DESCRIPTION: Draws a cyan line from (441, 134) to (384, 91).
; PLAN: r0=441(x1), r1=134(y1), r2=384(x2), r3=91(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 134
LDI r2, 384
LDI r3, 91
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
