; DESCRIPTION: Draws a cyan line from (103, 151) to (376, 198).
; PLAN: r0=103(x1), r1=151(y1), r2=376(x2), r3=198(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 151
LDI r2, 376
LDI r3, 198
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
