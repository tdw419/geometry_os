; DESCRIPTION: Draws a black line from (67, 221) to (509, 113).
; PLAN: r0=67(x1), r1=221(y1), r2=509(x2), r3=113(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 221
LDI r2, 509
LDI r3, 113
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
