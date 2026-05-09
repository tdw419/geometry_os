; DESCRIPTION: Draws a cyan line from (271, 188) to (181, 42).
; PLAN: r0=271(x1), r1=188(y1), r2=181(x2), r3=42(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 188
LDI r2, 181
LDI r3, 42
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
