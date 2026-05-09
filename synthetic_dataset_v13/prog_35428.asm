; DESCRIPTION: Draws a cyan line from (14, 202) to (384, 126).
; PLAN: r0=14(x1), r1=202(y1), r2=384(x2), r3=126(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 202
LDI r2, 384
LDI r3, 126
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
