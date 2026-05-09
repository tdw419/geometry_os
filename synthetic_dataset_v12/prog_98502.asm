; DESCRIPTION: Draws a cyan line from (113, 246) to (67, 50).
; PLAN: r0=113(x1), r1=246(y1), r2=67(x2), r3=50(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 246
LDI r2, 67
LDI r3, 50
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
