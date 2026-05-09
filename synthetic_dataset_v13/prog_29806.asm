; DESCRIPTION: Draws a yellow line from (76, 154) to (383, 228).
; PLAN: r0=76(x1), r1=154(y1), r2=383(x2), r3=228(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 154
LDI r2, 383
LDI r3, 228
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
