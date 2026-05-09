; DESCRIPTION: Composite: Renders a orange line between points (370, 54) and (168, 82) then Renders a blue box of size 38x103 starting at (128, 48).
; PLAN: r0=370(x1), r1=54(y1), r2=168(x2), r3=82(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=128(x), r6=48(y), r7=38(width), r8=103(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 370
LDI r1, 54
LDI r2, 168
LDI r3, 82
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 128
LDI r6, 48
LDI r7, 38
LDI r8, 103
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
