; DESCRIPTION: Renders a white line between points (261, 197) and (231, 42).
; PLAN: r0=261(x1), r1=197(y1), r2=231(x2), r3=42(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 197
LDI r2, 231
LDI r3, 42
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
