; DESCRIPTION: Composite: Draws a green line from (210, 6) to (50, 77) then Draws a purple rectangle at (395, 42) with width 16 and height 59.
; PLAN: r0=210(x1), r1=6(y1), r2=50(x2), r3=77(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=395(x), r6=42(y), r7=16(width), r8=59(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 210
LDI r1, 6
LDI r2, 50
LDI r3, 77
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 395
LDI r6, 42
LDI r7, 16
LDI r8, 59
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
