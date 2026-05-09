; DESCRIPTION: Composite: Renders a magenta box of size 41x73 starting at (308, 69) then Renders a yellow line between points (69, 60) and (113, 133).
; PLAN: r0=308(x), r1=69(y), r2=41(width), r3=73(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=69(x1), r6=60(y1), r7=113(x2), r8=133(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 308
LDI r1, 69
LDI r2, 41
LDI r3, 73
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 69
LDI r6, 60
LDI r7, 113
LDI r8, 133
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
